# Responsible for the conflicts view.
class ConflictsController < ApplicationController

  # GET /conflicts
  def index
    authorize self
  end

end


