class ApplicantController < ApplicationController
	before_filter :onlyapplicant

	def index
		@applicantworkshops = Workshopregistrations.where(:user_id => current_user.id).joins(:workshop)
	end

	def setticket
	end

	def checkdoattend
		ticket_number = params[:ticket_number]

		doattend = JSON.parse RestClient.get(Doattend)
		p = doattend['participants']
		thisuser = p.select {|k| k["Ticket_Number"] == ticket_number}

		unless thisuser.empty?
			if thisuser[0]['Email'] == current_user.email
				current_user.ticket_number = ticket_number
				current_user.save
			end
		end

		respond_to do |format|
	      unless thisuser.empty?
	        format.html { redirect_to applicant_path, notice: 'Webpage was successfully created.' }
	      else
	      	@ticketinfo = thisuser
	      	@error = 'eror'
	        format.html { render action: 'setticket' }
	      end
	    end
	end

	def uploadpassport
		@user = current_user
	end

	def passport
		xxx = true
		@user = current_user
		@user.passportscan = params[:user][:passportscan]
		respond_to do |format|
	      if @user.save
	        format.html { redirect_to applicant_path, notice: 'Webpage was successfully created.' }
	      else
	      	@error = 'error'
	        format.html { render action: 'uploadpassport' }
	      end
	    end
	end

	private

	def onlyapplicant
	    raise CanCan::AccessDenied unless current_user.applicant?
	end
end
