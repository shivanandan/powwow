class WorkshopExtra < ActiveRecord::Base
  belongs_to :workshop

  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type => ["application/pdf","application/vnd.ms-excel","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]
end
