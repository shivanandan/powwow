class Workshopregistrations < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :user
end
