# Policy for watched_prefixes
class SmartValidatorDb::WatchedPrefixesControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user != nil
  end

end
