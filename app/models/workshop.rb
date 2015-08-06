class Workshop < ActiveRecord::Base

  has_many :workshopconductorship
  has_many :users, :through => :workshopconductorship

  has_many :workshopregistrations
  has_many :users, :through => :workshopregistrations

  has_many :workshopextras

end
