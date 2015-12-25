class TicketTypesController < ApplicationController
  before_action :authorize
  before_action :set_event
  before_action :set_ticket_type, only: [:edit, :update, :destroy]

  def index
    @event_ticket_types = @event.ticket_types
  end

  def new
    @event_ticket_type = @event.ticket_types.build
  end

  def create
   # @event_ticket_type = TicketType.new(ticket_type_params)
    @event_ticket_type = @event.ticket_types.build(ticket_type_params)
    
    if @event_ticket_type.save
      redirect_to event_ticket_types_path, notice: "Save seccess."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
  def ticket_type_params
    params.require(:ticket_type).permit(:name, :event_id, :price, :max_quantity)
  end

  def set_ticket_type
    @event_ticket_type = TicketType.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
