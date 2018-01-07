# Interface class for a table in the main smart validator database.
class SmartValidatorDb::UserAnnouncement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'user_announcements'
end
