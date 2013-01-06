require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
    @future_events = Event.future_published_events
  end 
    
  test "should return midnight as a date" do
    midnight = Event.get_today_at_midnight
    assert midnight.is_a?(Date)
  end
    
  test "should return todays date at midnight" do
    today = Event.get_today_at_midnight
    assert_equal(today.strftime('%H:%M:%S'), '00:00:00')
  end
    
  test "should not return unpublished events" do
    assert !@future_events.include?(events(:far_future_not_published))
  end
  
  test "should return published events in the future" do
    assert @future_events.include?(events(:far_future_published))
  end
  
  test "should not return published past events" do
    assert !@future_events.include?(events(:far_past_published))
  end
  
end
