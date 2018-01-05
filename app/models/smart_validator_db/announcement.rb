# Interface class for a table in the main smart validator database.
class SmartValidatorDb::Announcement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'announcements'

  belongs_to :validated_roa,
             class_name: 'SmartValidatorDb::ValidatedRoa',
             foreign_key: :validated_roa_id
end
