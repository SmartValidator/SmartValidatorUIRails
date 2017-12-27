# Responsible for the static information pages.
class PagesController < ApplicationController

  # GET /
  def index
    authorize self
  end

end


