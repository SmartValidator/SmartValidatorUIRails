# Policy for validated roas
class SmartValidatorDb::ValidatedRoasControllerPolicy
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
