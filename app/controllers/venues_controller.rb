class VenuesController < ApplicationController
  before_action :authorize, only: [:new, :create]
  def new
    @venue = Venue.new
  end
  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to new_event_path
    else
      render 'new'
    end
  end
  private
  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id)
  end
end
