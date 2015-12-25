class TicketsController < ApplicationController
  before_action :authorize
  before_action :set_event
  
  def new
    @tickets = []
    @event.ticket_types.each do |t|
      ticket = Ticket.new
      ticket.event_id = @event.id
      ticket.user = current_user
      ticket.ticket_type_price = t.price
      ticket.quantity = 0
      ticket.ticket_type_id = t.id
      ticket.ticket_type_name = t.name
      @tickets << ticket
    end
  end

  def create
    print params
    redirect_to "new"
  end
  def buy

    @event.ticket_types.each do |t|
      print t.quantity
    end
  end  

  def index
    @tickets = @event.tickets
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end
end
