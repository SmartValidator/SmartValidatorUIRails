# Responsible for the rtr_status_entries.
class SmartValidatorDb::RtrStatusEntriesController < ApplicationController

  # GET smart_validator_db/rtr_status_entries
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::RtrStatusEntryDatatable.new(view_context)
      }
    end
  end

end
