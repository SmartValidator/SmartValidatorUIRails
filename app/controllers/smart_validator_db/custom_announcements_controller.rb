# Responsible for the local conflicts.
class SmartValidatorDb::CustomAnnouncementsController < ApplicationController

  # GET smart_validator_db/custom_announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::CustomAnnouncementDatatable.new(view_context)
      }
    end
  end

end


