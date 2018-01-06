class SmartValidatorDb::RtrStatusEntryDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :ipaddr_with_cidr, :link_to, :data_sources_path, :parse_prefix_param, :prefix_is_within_prefix?

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::RtrStatusEntry.id", cond: :eq},
      router: {source: "SmartValidatorDb::RtrStatusEntry.router", cond: :like},
      start_time: {source: "SmartValidatorDb::RtrStatusEntry.start_time", cond: :like},
      end_time: {source: "SmartValidatorDb::RtrStatusEntry.end_time", cond: :like},
      state: {source: "SmartValidatorDb::RtrStatusEntry.state", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        router: record.router,
        start_time: record.start_time.strftime("%Y-%m-%d, %H:%M"),
        end_time: record.end_time.strftime("%Y-%m-%d, %H:%M"),
        state: I18n.t("activerecord.meta.smart_validator_db.rtr_status_entries.state.#{record.state}")
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::RtrStatusEntry
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
