# Policy for watched_prefixes
class SmartValidatorDb::WatchedPrefixesControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user != nil
  end

  def create?
    index?
  end


end
