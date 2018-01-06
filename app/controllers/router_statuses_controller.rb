# Responsible for the conflicts view.
class RouterStatusesController < ApplicationController
  before_action :authenticate_user!

  # GET /router_status
  def show
    authorize self
  end

end

