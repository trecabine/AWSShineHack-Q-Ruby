class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /trips
  # GET /trips.json
  def index
    @trips = current_user.trips
    @trips.to_json
  end

  def places
    @trip = Trip.find_by_id(params[:id])
    #@trip.planned_places.each do |planned_place|
      #@planned_place =  Place.find_by_id(planned_place.place_id)
    #end
    #render :json =>  @trip.planned_places
    render :json =>  @trip.planned_places.to_json(:include => {:place => {:except => []} })
  end

  def oneplace
    @trip = Trip.find_by_id(params[:id])
    @pplace = @trip.planned_places.find(params[:place_id])
    render :json =>  @pplace.to_json(:include => {:place => {:except => []} })
  end

  def postplaces
    #@place = PlannedPlace.new(planned_place_params)
    #@trip.planned_places << @pplace
    @place = Place.new(place_params)
    @planned_place = Place.new
    @planned_place.place = @place
    @trip = Trip.find_by_id(params[:id])
    @trips.planned_places << @planned_place
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = current_user.trips.find(params[:id])
    puts "Trip " << @trip.id
    @trip.as_json
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.users << current_user

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        #format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :created_by, :modified_by, :image_url)
    end

    def planned_place_params
      params.require(:plannedplace).permit(:name, :place_id, :trip_id)
    end

    def place_params
      params.require(:place).permit(:name, :type, :price)
    end
end
