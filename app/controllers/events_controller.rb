class EventsController < ApplicationController
  
  def index
    @events = Event.order('event_start_date, event_start_date_time').all
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
