# Interface class for a table in the main smart validator database.
class SmartValidatorDb::RtrStatusEntry < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'rtr_status_entries'

  enum state: [
    :offline,
    :online
  ].freeze
end
