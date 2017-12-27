# Handles the error pages.
class ErrorsController < ApplicationController
  skip_after_action :verify_authorized

  # 403
  def forbidden
    render(:status => 403)
  end

  # 404
  def not_found
    render(:status => 404)
  end

  # 500
  def internal_server_error
    render(:status => 500)
  end

end