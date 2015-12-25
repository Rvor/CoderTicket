class Ticket < ActiveRecord::Base
  has_one :ticket_type
  belongs_to :user
  belongs_to :event
  
  attr_accessor :ticket_type_name
  attr_accessor :ticket_type_price
end
