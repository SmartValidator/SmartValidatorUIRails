# Responsible for the payload roas view.
class PayloadRoasController < ApplicationController
  before_action :authenticate_user!

  # GET /payload_roas
  def index
    authorize self
    @payload_roas = SmartValidatorDb::PayloadRoa.all
  end

end
