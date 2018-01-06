# handles the data for the graph generation.
class GraphsController < ApplicationController
  before_action :authenticate_user!
  include GraphsHelper

  # GET /graphs/conflict_status
  def conflict_status
    authorize self
    render json: {
      conflict_status: conflict_status_hash.to_json
    }
  end

  # GET /graphs/bgp_status
  def bgp_status
    authorize self
    render json: {
      bgp_status: bgp_status_hash.to_json
    }
  end

  # GET /graphs/timeline_conflicts
  def timeline_conflicts
    authorize self
    render json: {
      timeline_conflicts: timeline_conflicts_hash.to_json
    }
  end

  # GET /graphs/payload_roas
  def payload_roas
    authorize self
    render json: {
      payload_roas: payload_roas_hash.to_json
    }
  end

end

