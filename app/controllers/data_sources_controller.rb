# Responsible for the data sources view.
class DataSourcesController < ApplicationController

  # GET /data_sources
  def index
    authorize self
  end

end


