# Policy for payload roas
class SmartValidatorDb::PayloadRoasControllerPolicy
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
