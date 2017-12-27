# Responsible for the settings view.
class SettingsController < ApplicationController
  before_action :authenticate_user!

  # GET /settings
  def index
    authorize self
  end

end


