class ParticipantMailer < ActionMailer::Base
  default from: "sccsbng2015@gmail.com"

  def welcome_reviewer(user, password)
  	@user = user
    @password = password

    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : Reviewer Invite')
  end

  def alert_reviewers_of_reviews(user, reviews)
    @user = user
    @reviews = reviews
    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : New Abstracts Assigned')
  end
end
