# Responsible for the analyzed announcements.
class AnalyzedAnnouncementsController < ApplicationController
  before_action :authenticate_user!

  # GET /analyzed_announcements/:id
  def show
    authorize self
    return unless get_analyzed_announcement

    @connected_roas = []
    # Get all other analyzed entries which refer to the same verified announcements.
    SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.where(
      verified_announcement_id: @vrva.verified_announcement_id
    ).each do |vrva|
      @connected_roas.push(
        {
          roa: vrva.validated_roa,
          route_validity: vrva.route_validity
        }
      )
    end

    render partial: 'analyzed_announcements/show'
  end

  private

  # Retrieves the analyzed announcement from thr parameter
  def get_analyzed_announcement
    @vrva = SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.where(
      id: ActionController::Base.helpers.sanitize(params[:id])
    ).first

    unless @vrva
      flash[:notice] = I18n.t('general.not_found')
      redirect_to root_path
      return false
    end

    true
  end

end

