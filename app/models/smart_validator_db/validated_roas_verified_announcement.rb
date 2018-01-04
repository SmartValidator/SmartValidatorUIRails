# Interface class for a table in the main smart validator database.
class SmartValidatorDb::ValidatedRoasVerifiedAnnouncement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'validated_roas_verified_announcements'

  belongs_to :announcement,
             class_name: SmartValidatorDb::Announcement,
             foreign_key: :verified_announcement_id

  scope :resolved, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:resolved_conflict])}
  scope :raw_rpkis, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:raw_rpki])}
  scope :conflicts, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:conflict])}

  enum route_validity: [
    :reserved,
    :resolved_conflict,
    :raw_rpki,
    :conflict
  ].freeze
end
