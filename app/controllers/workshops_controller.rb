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

    # Write a redirect if the current user does not have a ticket
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
