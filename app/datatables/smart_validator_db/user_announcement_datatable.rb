class SmartValidatorDb::UserAnnouncementDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :link_to, :analyzed_announcement_path, :ipaddr_with_cidr, :link_to, :data_sources_path

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::UserAnnouncement.id", cond: :like},
      asn: {source: "SmartValidatorDb::UserAnnouncement.asn", cond: :like},
      prefix: {source: "SmartValidatorDb::UserAnnouncement.prefix", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        asn: record.asn,
        prefix: link_to(ipaddr_with_cidr(record.prefix), data_sources_path(prefix: ipaddr_with_cidr(record.prefix))),
        blocking_status: I18n.t("activerecord.meta.smart_validator_db.user_announcement.blocking_status.#{record.blocking_status}"),
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::UserAnnouncement.all
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
