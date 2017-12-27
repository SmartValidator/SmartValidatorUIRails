class SmartValidatorDb::ValidatedRoasVerifiedAnnouncementDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.id", cond: :eq},
      route_validity: {source: "SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validity", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        route_validity: record.route_validity
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
