# Policy for watched prefixes
class WatchedPrefixesControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user != nil
  end

  def create?
    new?
  end

end
