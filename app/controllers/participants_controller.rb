class ParticipantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :onlyboss
  # Commented cancancan here as it is raising an unitialized constant error
  # load_and_authorize_resource 

  
  def index
    @users = User.all
  end

  def edit_user
    @user = User.find(params[:user_id])
  end

  def save_edited
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to participants_path, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit_user' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    @user.nationality = 'IN'
    @user.password = Devise.friendly_token.first(8)
    @user.skip_confirmation!

    respond_to do |format|
      if @user.save
        ParticipantMailer.welcome_reviewer(@user, @user.password).deliver
        format.html { redirect_to participants_path, notice: 'Announcement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @announcement }
      else
        format.html { render action: 'new_user' }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def reviewers
    @users = User.where(:role => 'reviewer')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,:nationality, :middle_name, :gender, :title, :institutional_affiliation, :phone, :address, :pio, :oci, :guardian_names, :date_of_birth, :place_of_birth, :passport_number, :passport_place, :passport_date_of_issue, :passport_place_of_issue, :passport_date_of_expiry, :address_as_stated_in_your_passport, :indian_consulate, :role ,:email, :ticket_number, :passportscan, :student, :studying, :mothers_name, :consulate_email, :consulate_phone, :abstract_submitted)
  end

  def onlyboss
    raise CanCan::AccessDenied unless current_user.admin?
  end
end