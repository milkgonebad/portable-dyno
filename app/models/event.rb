class Event < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :description, :event_end_date, :event_end_date_time, :event_start_date, :event_start_date_time, :location, :name, :publish, :state, :zipcode
end
