class User < ActiveRecord::Base
  before_save :default_values
  before_save :override_fields
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable,:rememberable, :trackable, :validatable

  has_one :submission

  has_many :reviews

  has_attached_file :passportscan

  validates_attachment_content_type :passportscan, :content_type => ["application/pdf"]

  validates :first_name, presence:true
  # validates :middle_name
  validates :last_name, presence:true
  validates :gender, presence:true


  validates :phone, presence:true, :if => lambda {self.role == 'applicant'}
  validates :address, presence:true, :if => lambda {self.role == 'applicant'}

  validates :institutional_affiliation, presence:true, :if => lambda {self.role == 'applicant'}

  validates :nationality, presence:true, :if => lambda {self.role == 'applicant'}
  
  #validates_presence_of :pio, :unless => lambda {self.nationality == 'IN'}
  #validates_presence_of :oci, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :guardian_names, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :place_of_birth, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :date_of_birth, :unless => lambda {self.nationality == 'IN'}
  validates_presence_of :passport_number, :unless => lambda {self.nationality == 'IN'}
  # validates_presence_of :passport_place, :unless => lambda {self.nationality == 'IN'}
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

  def ticketless?
    self.ticket_number.nil?
  end

  def passportless?
    if self.nationality == 'IN'
      return false
    else
      !self.passportscan.exists?
    end
  end

  def abstractless?
    if self.abstract_submitted == true
      return false
    else
      return true
    end
  end

  def full_name
    return "#{self.first_name} #{self.middle_name} #{self.last_name}".titleize
  end

  private

  def override_fields
    if ( self.role == 'admin' or self.role == 'reviewer' )
      self.nationality = 'IN'
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
    if self.studying
      self.title = nil
    else
      self.student = nil
    end
    self.role ||= 'applicant'
  end

  def default_values
    self.role ||= 'applicant'
  end
end
