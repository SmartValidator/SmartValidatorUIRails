# Responsible for the watched_prefixes.
class SmartValidatorDb::WatchedPrefixesController < ApplicationController

  # GET smart_validator_db/watched_prefixes
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: SmartValidatorDb::WatchedPrefixDatatable.new(view_context)
      }
    end
  end

  # GET smart_validator_db/watched_prefixes
  def create
    authorize self
    @watched_prefix = SmartValidatorDb::WatchedPrefix.new(
      prefix: ActionController::Base.helpers.sanitize(params[:prefix])
    )
    render body: nil, status: (@watched_prefix.save ? 200 : 500)
  end

end
