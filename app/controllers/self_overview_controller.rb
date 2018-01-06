# Handles the self_overview
class SelfOverviewController < ApplicationController
  before_action :authenticate_user!

  # GET /self_overview
  def show
    authorize self
  end

end

