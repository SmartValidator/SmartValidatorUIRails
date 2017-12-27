# Responsible for the validated roas.
class SmartValidatorDb::ValidatedRoasController < ApplicationController

  # GET smart_validator_db/validated_roas
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::ValidatedRoaDatatable.new(view_context)
      }
    end
  end

end

