class Submission < ActiveRecord::Base
	belongs_to :user

	has_attached_file :visual_abstract, :styles => { :large => "1200x1200", :medium => "800x800>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :visual_abstract, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :introduction, :methods, :results, :discussion, :title, :authors, :gps_lat, :gps_lng, :previous_attendance, :bursary

	validates_length_of :title, :maximum => 20, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
	validates_length_of :introduction, :maximum => 100, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
	validates_length_of :methods, :maximum => 125, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
	validates_length_of :results, :maximum => 125, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
	validates_length_of :discussion, :maximum => 100, :too_long => " must be under 20 words.", :tokenizer => lambda { |str| str.split }
end
