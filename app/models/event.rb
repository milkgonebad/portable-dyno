class Event < ActiveRecord::Base
  
  has_many :tweets, :dependent => :destroy
  
  scope :future_published_events, lambda { where('publish = 1 AND event_start_date >= ?', self.get_today_at_midnight) }
  
  attr_accessible :name, :description, :event_start_date, :event_start_date_time, :event_end_date, 
    :event_end_date_time, :location, :address1, :address2, :city, :country, :state, :zipcode, :publish
  
  validates :name, :event_start_date, :location, :presence => true 
  
  
  # Valiation notes:
  # trust that date and times are in the correct format
  # trust that the app whitelists the text fields
  # don't validate zipcode in case this is in a different country 
  #   we may not even use zipcode until location is broken out into it's own model
  #   even then we may only need to worry about Mexico and Canada 
  #   we'll worry about fr_ca localization at that time
  
  #TODO:  UI Validation start date must be <= end date
  #  if end time is given, start time must be provided and must be before end date
  # start date should be today or in the future - will we ever backfill?  maybe?
  
  def self.get_today_at_midnight
    current = DateTime.now
    midnight = Date.new(current.year, current.month, current.day)
  end
   
end
