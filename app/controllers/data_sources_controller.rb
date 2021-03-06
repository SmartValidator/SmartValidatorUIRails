# Responsible for the data sources view.
class DataSourcesController < ApplicationController
  before_action :authenticate_user!

  # GET /data_sources
  def index
    authorize self
    parse_parameters
    @as_ranking = SmartValidatorDb::AsRanking.all
  end

  private

  # Parses the parameters and stores it in @params.
  def parse_parameters
    @params = {
      prefix: nil
    }
    parse_prefix_param(params[:prefix]) do |ip|
      @params[:prefix] = ip
    end
  end

end
