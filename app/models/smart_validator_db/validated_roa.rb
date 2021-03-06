# Interface class for a table in the main smart validator database.
class SmartValidatorDb::ValidatedRoa < ActiveRecord::Base
  establish_connection(:smart_validator_db)
  self.table_name = 'validated_roas'
  include PrefixMethods

  scope :filtered, proc {where(filtered: true)}
  scope :whitelisted, proc {where(whitelisted: true)}
end
