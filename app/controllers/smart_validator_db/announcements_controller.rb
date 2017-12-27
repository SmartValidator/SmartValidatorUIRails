# Responsible for the announcements.
class SmartValidatorDb::AnnouncementsController < ApplicationController

  # GET smart_validator_db/announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::AnnouncementDatatable.new(view_context)
      }
    end
  end

end


