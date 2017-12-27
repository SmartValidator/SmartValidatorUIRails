class SmartValidatorDb::ValidatedRoaDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id: {source: "SmartValidatorDb::ValidatedRoa.id", cond: :eq},
      asn: {source: "SmartValidatorDb::ValidatedRoa.asn", cond: :like},
      prefix: {source: "SmartValidatorDb::ValidatedRoa.prefix", cond: :like},
      max_length: {source: "SmartValidatorDb::ValidatedRoa.max_length", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        asn: record.asn,
        prefix: record.prefix,
        max_length: record.max_length
      }
    end
  end

  private

  def get_raw_records
    SmartValidatorDb::ValidatedRoa.all
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