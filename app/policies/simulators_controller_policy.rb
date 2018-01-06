# Policy for simulators
class SimulatorsControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    @user != nil
  end

end
