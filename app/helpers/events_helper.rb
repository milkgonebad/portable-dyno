module EventsHelper

  def get_time(time)
    time.nil? ? nil : I18n.l(time, :format => :short)
  end

end