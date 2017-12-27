# Policy for validated roas
class SmartValidatorDb::ValidatedRoasVerifiedAnnouncementsControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user != nil
  end

end
