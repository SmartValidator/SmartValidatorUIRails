# Policy for static pages
class PagesControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

end
