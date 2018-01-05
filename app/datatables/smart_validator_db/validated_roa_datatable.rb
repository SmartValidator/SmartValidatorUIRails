class SmartValidatorDb::ValidatedRoaDatatable < AjaxDatatablesRails::Base

  # Makes the link_to helper and routes available here.
  def_delegators :@view, :ipaddr_with_cidr

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
        prefix: ipaddr_with_cidr(record.prefix),
        max_length: record.max_length
      }
    end
  end

  private

  def get_raw_records
    q = SmartValidatorDb::ValidatedRoa.all

    # Add scopes
    q = q.filtered if params[:scope] == 'filtered'
    q = q.whitelisted if params[:scope] == 'whitelisted'

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
