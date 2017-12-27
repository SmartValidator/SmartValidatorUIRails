# Responsible for the data sources view.
class DataSourcesController < ApplicationController
  before_action :authenticate_user!

  # GET /data_sources
  def index
    authorize self
  end

end


