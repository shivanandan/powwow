class HomeController < ApplicationController
	# before_filter :authenticate_user!
	# load_and_authorize_resource

  def index
  	@announcements = Announcement.order('priority DESC').limit(4)
  end

end
