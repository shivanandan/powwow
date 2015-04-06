class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  def overview
    @submissions = Submission.includes(:reviews)
  end

  def get_free_reviewers
    @allreviewers = User.where(:role => 'reviewer')
    @submission = Submission.find(params[:submission_id])
    @reviews = Review.where(:submission_id => params[:submission_id]).includes(:users)
    @assigned_reviews = Review.where(:submission_id => params[:submission_id])

    respond_to do |format|
      format.js
      format.html
    end
  end

  def assign_reviewer
    @submission = Submission.find(params[:submission_id])
    @reviewer = User.find(params[:reviewer_id])

    # Find and see if the reviewer exists
    r = Review.where(:submission_id => params[:submission_id]).where(:user_id => params[:reviewer_id])

    if r.empty?
      @review = Review.new
      @review.submission_id = params[:submission_id]
      @review.user_id = params[:reviewer_id]

      @review.save
    else
      @review = r.first
      @errors = 'Reviewer has already been assigned to this submission'
    end

    
    respond_to do |format|
      format.js
      # format.html {redirect_to review_overview_path}
    end

    # Check if th
  end

  def unassign_reviewer
    @submission = Submission.find(params[:submission_id])
    @reviewer = User.find(params[:reviewer_id])
    @reviews = Review.where(:submission_id => params[:submission_id]).where(:user_id => params[:reviewer_id])
    @reviews.each do |r|
      r.destroy
    end

    respond_to do |format|
      format.js
      # format.html {redirect_to review_overview_path}
    end

  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    redirect_to reviewer_path if current_user.reviewer?
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:submission_id, :user_id, :conservation_score, :science_score, :visual_score, :recommendation, :comment_to_applicant, :comment_to_admin, :finalized, :view_count)
    end
end
