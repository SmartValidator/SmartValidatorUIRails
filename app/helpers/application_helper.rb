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

  def ipaddr_with_cidr(ipaddr)
    return '' unless ipaddr
    "#{ipaddr}/#{ipaddr.to_i.to_s(2).count("1")}"
  end

  # Parses a prefix parameter and performs the block.
  def parse_prefix_param
    if params[:prefix]
      ip = IPAddress.parse(
        ActionController::Base.helpers.sanitize(
          CGI::unescape(
            params[:prefix])
        )
      )
      yield(ip)
    end
  rescue
    # Do nothing, just ignore the parameter.
  end


end
