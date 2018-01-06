# Policy for graphs
class GraphsControllerPolicy
  attr_reader :user, :record

  # Initialization
  def initialize(user, record)
    @user = user
    @record = record
  end

  def conflict_status?
    @user != nil
  end

  def bgp_status?
    conflict_status?
  end

  def timeline_conflicts?
    conflict_status?
  end

end
