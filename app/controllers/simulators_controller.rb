# Handles the simulator
class SimulatorsController < ApplicationController
  before_action :authenticate_user!

  # GET /simulator
  def show
    authorize self
  end

end

