class ReviewerController < ApplicationController
	before_filter :onlyreviewer

	def index
	end

	private

	def onlyreviewer
	    raise CanCan::AccessDenied unless current_user.reviewer?
	end
end
