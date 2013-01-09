class Delivery < ActiveRecord::Base
  attr_accessible :send_at, :sent
  belongs_to :tweet
  validates :sent_at, :presence => true
  
  # processes the tweet
  def deliver
    #TODO
  end
  
end
