class TicketType < ActiveRecord::Base
  attr_accessor :quantity
  belongs_to :event
end
