class EntriesController < ApplicationController
  # GET /places/:place_id/entries/new
  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build # Build a new entry associated with @place
  end

  # POST /places/:place_id/entries
  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)

    if @entry.save
      redirect_to @place, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:title, :description, :date, :place_id) # Include other attributes as needed
    end
end
