# Responsible for the local conflicts.
class SmartValidatorDb::WatchedAnnouncementsController < ApplicationController

  # GET smart_validator_db/watched_announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::WatchedAnnouncementDatatable.new(view_context)
      }
    end
  end

end


