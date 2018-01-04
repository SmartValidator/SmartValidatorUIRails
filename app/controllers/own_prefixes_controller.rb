# Responsible for the my prefixes view.
class OwnPrefixesController < ApplicationController
  before_action :authenticate_user!

  # GET /my_prefixes
  def index
    authorize self

    respond_to do |format|
      format.html {
        render body: nil, status: 404
      }
      format.json {
        render json: OwnPrefixDatatable.new(view_context)
      }
    end
  end

  # GET /my_prefixes/new
  def new
    authorize self
    @own_prefix = OwnPrefix.new
    render partial: 'own_prefixes/new'
  end

  # POST /my_prefixes
  def create
    authorize self

    @own_prefix = OwnPrefix.new(
      prefix: ActionController::Base.helpers.sanitize(params[:prefix])
    )
    if @own_prefix.save
      render body: nil, status: 200
    else
      render json: {errors: @own_prefix.errors.messages}, status: 422
    end
  end

end
