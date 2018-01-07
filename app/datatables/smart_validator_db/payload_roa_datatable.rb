class SmartValidatorDb::PayloadRoaDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :ipaddr_with_cidr, :link_to, :data_sources_path, :parse_prefix_param

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::PayloadRoa.id", cond: :eq},
      asn: {source: "SmartValidatorDb::PayloadRoa.asn", cond: :like},
      prefix: {source: "SmartValidatorDb::PayloadRoa.prefix", cond: :like},
      max_length: {source: "SmartValidatorDb::PayloadRoa.max_length", cond: :like},
      filtered: {source: "SmartValidatorDb::PayloadRoa.filtered", cond: :like},
      whitelisted: {source: "SmartValidatorDb::PayloadRoa.whitelisted", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        asn: record.asn,
        prefix: link_to(ipaddr_with_cidr(record.prefix), data_sources_path(prefix: ipaddr_with_cidr(record.prefix))),
        max_length: record.max_length,
        filtered: record.filtered,
        whitelisted: record.whitelisted
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::PayloadRoa.all
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
