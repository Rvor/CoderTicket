class User < ActiveRecord::Base
  has_secure_password
  
  has_many :events

  validates :name, presence: true, length: {:in => 6..20 }
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true, confirmation: true
end
