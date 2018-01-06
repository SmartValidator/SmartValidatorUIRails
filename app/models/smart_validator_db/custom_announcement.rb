# Interface class for a table in the main smart validator database.
class SmartValidatorDb::CustomAnnouncement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'custom_announcements'

  enum blocking_status: [
    :unaffected,
    :blocked,
    :secured
  ].freeze
end
