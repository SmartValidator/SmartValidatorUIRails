# Responsible for the static information pages.
class PagesController < ApplicationController

  # GET /
  def index
    authorize self

    @status_boxes = {}
    SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.select(
      'route_validity, COUNT(*)'
    ).group(
      :route_validity
    ).each_with_index do |conflict_entry, i|
      @status_boxes[conflict_entry.route_validity.to_sym] = {
        count: conflict_entry.count
      }
    end
    @status_boxes[:unknown] = {
      count: SmartValidatorDb::Announcement.find_by_sql(
        "SELECT DISTINCT id FROM announcements EXCEPT SELECT DISTINCT announcement_id FROM validated_roas_verified_announcements;"
      ).count
    }

  end

end


