module ApplicationHelper

  def display_errors(errors)
    errors.inject("") do |error_string, error|
      error_string += content_tag(:p, error, :class => "error_message")
    end.html_safe
  end
end
