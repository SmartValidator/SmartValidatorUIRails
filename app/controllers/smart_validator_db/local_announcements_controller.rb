# Responsible for the local conflicts.
class SmartValidatorDb::LocalAnnouncementsController < ApplicationController

  # GET smart_validator_db/local_announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::LocalAnnouncementDatatable.new(view_context)
      }
    end
  end

end


