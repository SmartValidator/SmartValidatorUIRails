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
  def parse_prefix_param(p)
    return unless p
    ip = IPAddress.parse(
      ActionController::Base.helpers.sanitize(
        CGI::unescape(
          p
        )
      )
    )
    yield(ip)
  rescue
    # Do nothing, just ignore the parameter.
  end

  # Is true if the inner ip is included in the outer_prefix
  def prefix_is_within_prefix?(inner_prefix, outer_prefix)
    # TODO Fix this as soon as the bug with the cidr is solved.
    return false
    outer = IPAddress.parse(
      ActionController::Base.helpers.sanitize(
        CGI::unescape(outer_prefix)
      )
    )
    outer = IPAddress.parse(
      ActionController::Base.helpers.sanitize(
        CGI::unescape(inner_prefix)
      )
    )

    (outer == inner)
  rescue
    false
  end

end
