class PlacesController < ApplicationController
  # GET /places
  def index
    @places = Place.all
  end

  # GET /places/:id
  def show
    @place = Place.find(params[:id])
    @entries = @place.entries # Assuming you have a one-to-many relationship set up
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # POST /places
  def create
    @place = Place.new(place_params)
    
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name) # Include other attributes as needed
    end
end
