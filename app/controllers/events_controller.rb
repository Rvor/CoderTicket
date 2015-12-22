class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create]


  def index
    @events = Event.all    
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end
  private
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :name, :extended_html_description, :category_id, :hero_image_url)
  end
end
