# Responsible for the settings view.
class SettingsController < ApplicationController

  # GET /settings
  def index
    authorize self
  end

end


