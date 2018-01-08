# Responsible for the conflicts view.
class RouterStatusesController < ApplicationController
  before_action :authenticate_user!

  # GET /router_status
  def show
    authorize self
    @current_router_state = get_current_router_state
  end

  private

  def get_current_router_state
    # TODO This is not very smart.
    ret = []
    SmartValidatorDb::RtrStatusEntry.select(:router).group(:router).each do |rtr_status_entry|
      last_entry = SmartValidatorDb::RtrStatusEntry.all.where(router: rtr_status_entry.router).reorder('created_at DESC').limit(1).first
      ret.push(
        {
          router: rtr_status_entry.router,
          state: last_entry.state,
          created_at: last_entry.created_at
        }
      )
    end
    ret
  end

end

