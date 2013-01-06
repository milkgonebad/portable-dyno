class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.order('event_start_date, event_start_date_time').all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path, :notice => 'Event was successfully created.'
    else
      render :new 
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_path, :notice => 'Event was successfully updated.'
    else
      render :edit 
    end
  end
  
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end
  
  #TODO add a preview event feature before publishing
  def preview
  end

end