# General helper methods.
module ApplicationHelper

  # Returns the title string of a view.
  def full_title(page_title)
    base_title = Rails.configuration.global[:platform][:name]

    if page_title.empty?
      base_title
    else
      "#{base_title} — #{page_title}".html_safe
    end
  end

end
