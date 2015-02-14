class User < ActiveRecord::Base
  before_save :default_values
  before_save :override_fields
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable,:rememberable, :trackable, :validatable

  validates :first_name, presence:true
  # validates :middle_name
  validates :last_name, presence:true
  validates :gender, presence:true
  validates :phone, presence:true
  validates :address, presence:true

  validates :title, presence:true
  validates :institutional_affiliation, presence:true

  validates :nationality, presence:true
  
  validates_presence_of :pio, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :oci, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :guardian_names, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :place_of_birth, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :date_of_birth, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_number, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_place, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_date_of_issue, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_place_of_issue, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_date_of_expiry, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :address_as_stated_in_your_passport, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :indian_consulate  , :unless => lambda {self.nationality == 'IN'}



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

  def override_fields
    if self.nationality == 'IN'
      self.pio = nil
      self.oci = nil
      self.guardian_names = nil
      self.date_of_birth = nil
      self.place_of_birth = nil
      self.passport_number = nil
      self.passport_place = nil
      self.passport_place_of_issue = nil
      self.passport_place_of_issue = nil
    end
    self.role ||= 'applicant'
  end

  def default_values
    self.role ||= 'applicant'
  end
end
