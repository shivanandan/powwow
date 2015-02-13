class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end

  private

  def send_welcome_mail
    YimMailer.welcome_email(self, self.password).deliver
  end

  def set_default_role
    self.role ||= 'applicant'
  end
end
