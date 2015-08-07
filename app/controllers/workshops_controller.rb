class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]
  before_action :set_resourcepeople, only: [:new, :edit, :allresourcepeople]
  load_and_authorize_resource

  # GET /workshops
  # GET /workshops.json
  def index
    @workshops = Workshop.all
  end

  def main
    @workshops = Workshop.all
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
    @workshop_extras = WorkshopExtra.where(:workshop_id => params[:id])
    @workshop_extra = WorkshopExtra.new
    @registered_participants = Workshopregistrations.where(:workshop_id => params[:id])
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.current_seats = 0

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'Workshop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workshop }
      else
        format.html { render action: 'new' }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, notice: 'Workshop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url }
      format.json { head :no_content }
    end
  end

  def allresourcepeople
    @w = Workshop.find(params[:workshop_id])
    @conductorship = Workshopconductorship.where(:workshop_id => @w.id)
    @thesepeople = [];

    @conductorship.each do |c|
      @thesepeople << c.user
    end

    @resourcepeople = User.where(:role => 'resourceperson') - @thesepeople
    respond_to do |format|
      format.js
    end
  end

  def addresourceperson
    @u = User.find(params[:user_id])
    @w = Workshop.find(params[:workshop_id])
    @message = false

    @workshopconductor = Workshopconductorship.new
    @workshopconductor.user_id = @u.id
    @workshopconductor.workshop_id = @w.id
    if @workshopconductor.save
      @message = true
    else
      @message = false
    end
    respond_to do |format|
      format.js
    end
  end

  def removeresourceperson
    @workshopconductor = Workshopconductorship.where(:user_id => params[:user_id]).where(:workshop_id => params[:workshop_id])
    @workshopconductor.each do |w|
      w.destroy
    end

    respond_to do |format|
      format.js
    end
  end

  def listall
    @workshops = Workshop.all
    @day1 = Workshop.where(:day => 1)
    @day2 = Workshop.where(:day => 2)
    @day3 = Workshop.where(:day => 3)
    @day4 = Workshop.where(:day => 4)
    @registered = Workshopregistrations.where(:user_id => current_user.id)

    @daysfilled = []
    @registered.each do |r|
      @daysfilled.push r.workshop.day
    end

    # Write a redirect if the current user does not have a ticket
  end

  def register
    @registration = Workshopregistrations.new
    @registration.user_id = params[:user_id]
    @registration.workshop_id = params[:workshop_id]
    @workshop = Workshop.find(params[:workshop_id])
    @workshop.current_seats.nil? ? @workshop.current_seats = 0 : @workshop.current_seats
    @workshop.current_seats = @workshop.current_seats + 1
    if current_user.applicant?
      @registration.user_id = current_user.id
    end

    @user_registrations = Workshopregistrations.where(:user_id => @registration.user_id)
    @registeredworkshops = []
    @days = []
    @user_registrations.each do |r|
      @registeredworkshops.push r.workshop_id
      @days.push r.workshop.day
    end

    @noofattendees = Workshopregistrations.where(:workshop_id => params[:workshop_id]).count


    if @registeredworkshops.include? params[:workshop_id].to_i
      message = 'You cannot register for the same workshop twice'
    elsif @noofattendees >= @workshop.maximum_seats
      message = "#{@workshop.title} is has filled up. Please try another one."
    elsif @days.include? @workshop.day
      message = "You cannot register for two workshops on the same day."
    else
      @workshop.save
      @registration.save
      message = "You have been registered for the workshop : #{@workshop.title}"
    end


    respond_to do |format|
      format.html { redirect_to listall_path, notice: message }
    end
  end

  def deregister
    @registrations = Workshopregistrations.where(:user_id => params[:user_id]).where(:workshop_id => params[:workshop_id])
    @workshop = Workshop.find(params[:workshop_id])
    @workshop.current_seats = @workshop.current_seats - @registrations.length
    @workshop.save
    @registrations.destroy_all
    respond_to do |format|
      format.js
    end
  end

  def mail_participants
    @workshop = Workshop.find params[:workshop_id]
    @registered = Workshopconductorship.where(:user_id => current_user.id).where(:workshop_id => params[:workshop_id])
    if @registered.empty? or !current_user.admin?
      redirect_to post_login_path
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def send_mail
    @workshop = Workshop.find(params['workshoppp']['workshop_id'])
    @subject = params['workshoppp']['subject']
    @body = params['workshoppp']['body']
    @users = []
    @registrations = Workshopregistrations.where(:workshop_id => @workshop.id)
    @registrations.each do |r|
      @users.push r.user.email
    end
    @resourceperson = current_user
    ParticipantMailer.send_workshop_mailer(@workshop, @users, @resourceperson, @subject, @body).deliver

    respond_to do |format|
      format.html { redirect_to post_login_path, notice: 'Sent Mail Successfully' }
    end
  end

  def toggle_registrations
    unless current_user.admin?
      redirect_to post_login_path
    end
    @conference.workshop_registration_flag = !@conference.workshop_registration_flag
    @conference.save
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    def set_resourcepeople
      @resourcepeople = User.where(:role => 'resourceperson')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(:title, :level, :description, :category, :keywords, :maximum_seats, :current_seats, :day, :time, :duration)
    end
end
