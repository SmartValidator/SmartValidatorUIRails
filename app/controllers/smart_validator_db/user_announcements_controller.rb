# Responsible for the local conflicts.
class SmartValidatorDb::UserAnnouncementsController < ApplicationController

  # GET smart_validator_db/user_announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::UserAnnouncementDatatable.new(view_context)
      }
    end
  end

end


