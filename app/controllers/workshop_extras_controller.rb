class WorkshopExtrasController < ApplicationController
  before_action :set_workshop_extra, only: [:show, :edit, :update, :destroy]

  # GET /workshop_extras
  # GET /workshop_extras.json
  def index
    @workshop_extras = WorkshopExtra.all
  end

  # GET /workshop_extras/1
  # GET /workshop_extras/1.json
  def show
  end

  # GET /workshop_extras/new
  def new
    @workshop_extra = WorkshopExtra.new
  end

  # GET /workshop_extras/1/edit
  def edit
  end

  # POST /workshop_extras
  # POST /workshop_extras.json
  def create
    @workshop_extra = WorkshopExtra.new(workshop_extra_params)

    respond_to do |format|
      if @workshop_extra.save
        format.html { redirect_to workshop_path(@workshop_extra.workshop_id), notice: 'Workshop extra was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workshop_extra }
      else
        format.html { redirect_to workshop_path(@workshop_extra.workshop_id), notice: 'Workshop extra was successfully created.' }
        format.json { render json: @workshop_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshop_extras/1
  # PATCH/PUT /workshop_extras/1.json
  def update
    respond_to do |format|
      if @workshop_extra.update(workshop_extra_params)
        format.html { redirect_to workshop_path(@workshop_extra.workshop_id), notice: 'Workshop extra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workshop_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshop_extras/1
  # DELETE /workshop_extras/1.json
  def destroy
    @w = Workshop.find @workshop_extra.workshop_id
    @workshop_extra.destroy
    respond_to do |format|
      format.html { redirect_to workshop_path(@w.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop_extra
      @workshop_extra = WorkshopExtra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_extra_params
      params.require(:workshop_extra).permit(:title, :description, :link, :workshop_id, :attachment)
    end
end
