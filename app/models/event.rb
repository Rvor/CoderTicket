class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types
  has_many :tickets


  def self.upcoming
    where("published=true and starts_at >= ?", DateTime.now)
  end
  
end
