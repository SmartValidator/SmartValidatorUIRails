class SmartValidatorDb::ValidatedRoasVerifiedAnnouncementDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :link_to, :analyzed_announcement_path, :ipaddr_with_cidr, :link_to, :data_sources_path

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
        announcement_prefix: link_to(ipaddr_with_cidr(record.announcement.prefix), data_sources_path(prefix: ipaddr_with_cidr(record.announcement.prefix))),
        actions: link_to(I18n.t('general.details'), '#', 'data-show-path' => analyzed_announcement_path(record), class: 'analyzed-announcement-entry')
      }
    end
  end

  private

  def get_raw_records
    q = SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.all.select(
      :id, :verified_announcement_id
    ).group(
      :verified_announcement_id, :id
    )

    # Add scopes
    q = q.valid if params[:routevalidity] == 'valid'
    q = q.invalid if params[:routevalidity] == 'invalid'
    q = q.unknown if params[:routevalidity] == 'unknown'

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
