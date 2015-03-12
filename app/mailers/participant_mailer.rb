class ParticipantMailer < ActionMailer::Base
  default from: "sccsbng2015@gmail.com"

  def welcome_reviewer(user, password)
  	@user = user
    @password = password

    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : Reviewer Invite')
  end
end
