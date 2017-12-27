# Responsible for the validated roas/verified announcements.
class SmartValidatorDb::ValidatedRoasVerifiedAnnouncementsController < ApplicationController

  # GET smart_validator_db/smart_validator_db_validated_roas_verified_announcements
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::ValidatedRoasVerifiedAnnouncementDatatable.new(view_context)
      }
    end
  end

end


