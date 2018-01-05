# Interface class for a table in the main smart validator database.
class SmartValidatorDb::ValidatedRoasVerifiedAnnouncement < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'validated_roas_verified_announcements'

  belongs_to :announcement,
             class_name: 'SmartValidatorDb::Announcement',
             foreign_key: :verified_announcement_id

  belongs_to :validated_roa,
             class_name: 'SmartValidatorDb::ValidatedRoa',
             foreign_key: :validated_roa_id

  scope :valid, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:is_valid])}
  scope :invalid_asn, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:invalid_asn])}
  scope :invalid_length, proc {where(route_validity: SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities[:invalid_length])}
  scope :invalid, proc { invalid_asn.or(invalid_length) }
  scope :unknown, proc {
    not("route_validity = ANY(ARRAY[#{SmartValidatorDb::ValidatedRoasVerifiedAnnouncement.route_validities.map {|e| e[1]}}])")
  }

  enum route_validity: [
    :is_valid,
    :invalid_asn,
    :invalid_length
  ].freeze
end
