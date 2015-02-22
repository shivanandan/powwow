class Submission < ActiveRecord::Base
	belongs_to :user

	has_attached_file :visual_abstract, :styles => { :large => "1200x1200", :medium => "800x800>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :visual_abstract, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :introduction, :methods, :results, :discussion, :title, :authors, :co_authors, :gps, :poster, :previous_attendance, :attendance_year, :previous_bursary, :bursary, :reason_for_bursary

	validates_length_of :title, :maximum => 20, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
end
