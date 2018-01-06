# Responsible for the watched_prefixes.
class SmartValidatorDb::WatchedPrefixesController < ApplicationController

  # GET smart_validator_db/watched_prefixes
  def create
    authorize self
    @watched_prefix = SmartValidatorDb::WatchedPrefix.new(
      prefix: ActionController::Base.helpers.sanitize(params[:prefix])
    )
    render body: nil, status: (@watched_prefix.save ? 200 : 500)
  end

end
