class HomeController < ApplicationController
  
  def index
#    @events = Event.future_published_events
    render :layout => 'home_index'
  end
  
  def contact
    @marquee_title = 'Schedule an Event'
  end
  
  def faq
    @marquee_title = 'Frequently Asked Questions'
  end
  
  def about
    @marquee_title = 'About Our Dyno'
  end
  
  def gallery
    @marquee_title = 'Gallery'
  end
  
end
