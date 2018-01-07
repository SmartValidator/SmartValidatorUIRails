# Responsible for the payload roas.
class SmartValidatorDb::PayloadRoasController < ApplicationController

  # GET smart_validator_db/payload_roas
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::PayloadRoaDatatable.new(view_context)
      }
    end
  end

end

