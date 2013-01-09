class Tweet < ActiveRecord::Base
  attr_accessible :event_id, :message
  belongs_to :event
  has_many :deliveries
  
  validates :message, :presence => true 
end
