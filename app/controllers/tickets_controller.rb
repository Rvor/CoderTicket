class TicketsController < ApplicationController
  before_action :authorize
  before_action :set_event
  
  def new
  end

  def create
    print params
    redirect_to "new"
  end
  def buy
    params[:event_tickets][:tickets].each do |key, ticket| 
      if ticket[:quantity].to_i > 0 && ticket[:quantity].to_i <= 10
        @ticket = Ticket.new
        @ticket.event = @event
        @ticket.user = current_user
        @ticket.ticket_type_id = ticket[:id]
        @ticket.quantity = ticket[:quantity].to_i
        @ticket.save
      end
    end
    redirect_to @event, notice: "Buyed successfully."
    #redirect_to event_tickets_path 
  end  

  def index
    @tickets = @event.tickets.where("user_id = ?", current_user)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end
end
