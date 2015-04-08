class ReviewerController < ApplicationController
	before_filter :onlyreviewer

	def index
		@reviews = Review.where(:user_id => current_user.id).includes(:submission)
	end

	def review_submission
		@submission = Submission.find(params[:submission_id])
		@reviews = Review.where(:submission_id => @submission.id).where(:user_id => current_user.id)
		raise CanCan::AccessDenied if @reviews.empty?

		@review = @reviews[0]


		@review.view_count = @review.view_count + 1 unless @review.view_count.nil?
		@review.view_count = 1 if @review.view_count.nil?

		@review.save unless @review.finalized
	end

	private

	def onlyreviewer
	    raise CanCan::AccessDenied unless current_user.reviewer?
	end
end
