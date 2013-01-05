module UsersHelper
  
  def display_error_messages
    return "" if @user.errors.empty?
    messages = @user.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "Errors when saving"
    
    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML
    
    html.html_safe
  end
  
end
