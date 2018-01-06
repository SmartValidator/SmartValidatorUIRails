# Interface class for a table in the main smart validator database.
class SmartValidatorDb::PayloadRoa < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'payload_roas'
end
