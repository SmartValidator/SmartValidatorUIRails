# Responsible for the my prefixes view.
class WatchedPrefixesController < ApplicationController
  before_action :authenticate_user!

  # GET /watched_prefixes/new
  def new
    authorize self
    @watched_prefix = SmartValidatorDb::WatchedPrefix.new
    render partial: 'watched_prefixes/new'
  end

  # POST /watched_prefixes
  def create
    authorize self

    @watched_prefix = SmartValidatorDb::WatchedPrefix.new(
      prefix: ActionController::Base.helpers.sanitize(params[:prefix])
    )
    if @watched_prefix.save
      render body: nil, status: 200
    else
      render json: {errors: @watched_prefix.errors.messages}, status: 422
    end
  end

end
