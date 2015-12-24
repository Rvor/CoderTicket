class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  #validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    where("published=true and starts_at >= ?", DateTime.now)
  end
end
