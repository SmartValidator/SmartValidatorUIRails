# Interface class for a table in the main smart validator database.
class SmartValidatorDb::TimelineConflict < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'timeline_conflicts'

  default_scope { reorder('check_date ASC') }
end
