class SmartValidatorDb::AnnouncementDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :ipaddr_with_cidr

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::Announcement.id", cond: :eq},
      asn: {source: "SmartValidatorDb::Announcement.asn", cond: :like},
      prefix: {source: "SmartValidatorDb::Announcement.prefix", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        asn: record.asn,
        prefix: ipaddr_with_cidr(record.prefix)
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::Announcement.all
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
