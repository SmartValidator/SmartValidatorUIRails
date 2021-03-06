class SmartValidatorDb::WatchedPrefixDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :link_to, :analyzed_prefix_path, :ipaddr_with_cidr, :link_to, :data_sources_path

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::WatchedPrefix.id", cond: :like},
      prefix: {source: "SmartValidatorDb::WatchedPrefix.prefix", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        prefix: link_to(ipaddr_with_cidr(record.prefix), data_sources_path(prefix: ipaddr_with_cidr(record.prefix)))
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::WatchedPrefix.all
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
