# Policy for own prefixes
class OwnPrefixesControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user != nil
  end

  def new?
    index?
  end

  def create?
    index?
  end

end
