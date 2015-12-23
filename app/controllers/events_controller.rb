class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create, :mylist]


  def index
    @events = Event.upcoming    
  end
  
  def mylist
    @events = current_user.events
  end
  def search
    @events = Event.upcoming.basic_search(params[:search])
  end  
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save(validate: false)
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
