# Policy for settings
class SettingsControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user != nil
  end

  def set_key?
    index?
  end

end
