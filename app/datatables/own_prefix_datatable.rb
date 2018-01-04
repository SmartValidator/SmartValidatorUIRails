class OwnPrefixDatatable < AjaxDatatablesRails::Base

  def view_columns
    @view_columns ||= {
      id: {source: "OwnPrefix.id", cond: :eq},
      prefix: {source: "OwnPrefix.prefix", cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        prefix: record.prefix
      }
    end
  end

  private

  def get_raw_records
    OwnPrefix.all
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
