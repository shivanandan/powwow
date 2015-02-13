class User < ActiveRecord::Base
  before_save :default_values
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable,:rememberable, :trackable, :validatable

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :gender, presence:true

  def admin?
    self.role == "admin"
  end

  def reviewer?
    self.role == "reviewer"
  end

  def applicant?
    self.role == "applicant"
  end

  private

  def send_welcome_mail
    YimMailer.welcome_email(self, self.password).deliver
  end

  def default_values
    self.role ||= 'applicant'
  end
end
