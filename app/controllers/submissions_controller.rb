class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all(:include => :user)
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id

    @user = User.find(current_user.id)
    @user.abstract_submitted = true

    respond_to do |format|
      if @submission.save and @user.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @submission }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :abstract, :authors, :co_authors, :gps_lat, :gps_lng, :poster, :previous_attendance, :attendance_year, :previous_bursary, :bursary, :reason_for_bursary, :introduction, :methods, :results, :discussion, :visual_abstract, :presenter, :current_institution, :other_institutional_affiliations, :keywords)
    end
end
