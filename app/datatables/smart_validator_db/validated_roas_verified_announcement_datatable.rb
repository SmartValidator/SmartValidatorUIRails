class SmartValidatorDb::ValidatedRoasVerifiedAnnouncementDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.id", cond: :eq},
      announcement_asn: {source: "SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.announcement_asn", cond: :like},
      announcement_prefix: {source: "SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.announcement_prefix", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        announcement_asn: record.announcement.asn,
        announcement_prefix: record.announcement.prefix
      }
    end
  end

  private

  def get_raw_records
    q = SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.all

    # Add scopes
    q = q.resolved if params[:routevalidity] == 'resolved_conflict'
    q = q.raw_rpkis if params[:routevalidity] == 'raw_rpki'
    q = q.conflicts if params[:routevalidity] == 'conflict'

    q
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
