class ApplicantController < ApplicationController
	before_filter :onlyapplicant

	def index
	end

	def setticket

	end

	def checkdoattend
		xx = true
		respond_to do |format|
	      if xx
	        format.html { redirect_to applicant_path, notice: 'Webpage was successfully created.' }
	      else
	      	@error = 'jnjnjn'
	        format.html { render action: 'setticket' }
	      end
	    end
	end

	private

	def onlyapplicant
	    raise CanCan::AccessDenied unless current_user.applicant?
	  end


end
