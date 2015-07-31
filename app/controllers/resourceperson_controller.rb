class ResourcepersonController < ApplicationController
  before_filter :onlyresourceperson

  def index
    @workshopconductorships = Workshopconductorship.where(:user_id => current_user.id)
  end

  private

  def onlyresourceperson
      raise CanCan::AccessDenied unless current_user.resourceperson?
  end
end
