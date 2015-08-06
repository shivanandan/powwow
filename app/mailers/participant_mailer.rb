class ParticipantMailer < ActionMailer::Base
  default from: "sccsbng2015@gmail.com"

  def welcome_reviewer(user, password)
  	@user = user
    @password = password

    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : Resource Person Invite')
  end

  def alert_reviewers_of_reviews(user, reviews)
    @user = user
    @reviews = reviews
    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : New Abstracts Assigned')
  end

  def mail_participant(user, submission, subject ,body)
    @user = user
    @submission = submission
    mail(to: @user.email, subject: subject)
  end

  def inform_user_of_status(user, submission, reviews)
    @user = user
    @submission = submission
    @reviews = reviews
    mail(to: @user.email, subject: 'SCCS-Bengaluru 2015 : Decision on your Abstract')
    # mail(to: 'arjuna.shankar@gmail.com', subject: 'SCCS-Bengaluru 2015 : New Abstracts Assigned')
  end

  def send_workshop_mailer(workshop, users, resourceperson, subject, body)
    @workshop = workshop
    @users = users
    @resourceperson = resourceperson
    @subject = subject
    @body = body
    mail(to: @resourceperson.email, cc: @users, subject: @subject)
  end
end
