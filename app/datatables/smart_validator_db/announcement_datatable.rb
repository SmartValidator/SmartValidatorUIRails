class SmartValidatorDb::AnnouncementDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :ipaddr_with_cidr, :link_to, :data_sources_path, :parse_prefix_param

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
        prefix: link_to(ipaddr_with_cidr(record.prefix), data_sources_path(prefix: ipaddr_with_cidr(record.prefix)))
      }
    end
  end

  private

  def get_raw_records
    q = SmartValidatorDb::Announcement.all
    parse_prefix_param do |ip|
      q = q.in_prefix(ip)
    end
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
