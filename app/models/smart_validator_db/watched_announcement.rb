# Interface class for a table in the main smart validator database.
class SmartValidatorDb::WatchedAnnouncement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'watched_announcements'

  enum blocking_state: [
    :unaffected,
    :blocked,
    :secured
  ]

end
