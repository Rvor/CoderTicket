class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create, :mylist]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :publish]

  def index
    @events = Event.upcoming    
  end
  
  def mylist
    @events = current_user.events
  end
  def search
    @events = Event.upcoming.basic_search(params[:search][:query])
    #@events = Event.basic_search(params[:search][:query])
  end  
  def show
  end

  def new
    @event = current_user.events.build
  end

  def publish
    if @event.ticket_types.count == 0 
      redirect_to @event, alert: "Please add ticket types before publish."
    else
      Event.update(@event.id, published: true)
      redirect_to @event, notice: "Your event was published."
    end
  end
  def create
    @event = current_user.events.build(event_params)
    if @event.save(validate: false)
      redirect_to @event
    else
      render "new"
    end
  end
  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Your event has been udpated."
    else
      render 'edit'
    end
  end
  private
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :name, :extended_html_description, :category_id, :hero_image_url, :venue_id)
  end
  def set_event
    @event = Event.find(params[:id])
  end
end
