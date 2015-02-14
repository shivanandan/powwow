class ParticipantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :onlyboss
  # Commented cancancan here as it is raising an unitialized constant error
  # load_and_authorize_resource 

  
  def index
    @users = User.all
  end

  private

  def user_params
    # params.require(:user).permit(:email, :role, :first_name, :last_name, :organisation, :designation, :gender)
  end

  def onlyboss
    raise CanCan::AccessDenied unless current_user.admin?
  end
end