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

    respond_to do |format|
      format.js
      format.html
    end
  end

  def assign_reviewer
  end

  def unassign_reviewer
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
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
