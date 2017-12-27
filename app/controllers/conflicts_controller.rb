# Responsible for the conflicts view.
class ConflictsController < ApplicationController
  before_action :authenticate_user!

  # GET /conflicts
  def index
    authorize self
  end

end


