class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, if: lambda {!devise_controller?}

  private

  # Returns a 403 page if the user isn't authenticated.
  def user_not_authorized
    render :file => File.join(Rails.root, 'app/views/errors/forbidden.html.haml'),
           :status => 403,
           :layout => false
  end

end
