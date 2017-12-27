# Old class interface. Can be deleted after the migration to the new platform is completed.
class SmartValidatorDb::Announcement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'announcements'
end
