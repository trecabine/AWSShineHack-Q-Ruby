class PlannedPlacesController < ApplicationController
  before_action :set_planned_place, only: [:show, :edit, :update, :destroy]

  # GET /planned_places
  # GET /planned_places.json
  def index
    @planned_places = PlannedPlace.all
  end

  # POST /planned_places/1/vote
  def vote
    @planned_place = PlannedPlaces.all.where('id == ?', params[:id])
    @planned_place.votes += 1
  end

  def 

  # GET /planned_places/1
  # GET /planned_places/1.json
  def show
  end

  # GET /planned_places/new
  def new
    @planned_place = PlannedPlace.new
  end

  # GET /planned_places/1/edit
  def edit
  end

  # POST /planned_places
  # POST /planned_places.json
  def create
    @planned_place = PlannedPlace.new(planned_place_params)

    respond_to do |format|
      if @planned_place.save
        format.html { redirect_to @planned_place, notice: 'Planned place was successfully created.' }
        format.json { render :show, status: :created, location: @planned_place }
      else
        format.html { render :new }
        format.json { render json: @planned_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planned_places/1
  # PATCH/PUT /planned_places/1.json
  def update
    respond_to do |format|
      if @planned_place.update(planned_place_params)
        format.html { redirect_to @planned_place, notice: 'Planned place was successfully updated.' }
        format.json { render :show, status: :ok, location: @planned_place }
      else
        format.html { render :edit }
        format.json { render json: @planned_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_places/1
  # DELETE /planned_places/1.json
  def destroy
    @planned_place.destroy
    respond_to do |format|
      format.html { redirect_to planned_places_url, notice: 'Planned place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planned_place
      @planned_place = PlannedPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planned_place_params
      params.require(:planned_place).permit(:visit_time, :place_id, :trip_id, :votes)
    end
end
