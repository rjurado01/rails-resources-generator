class YYYController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    #@scope = @scope.filter(filter_params).order_by(order_params)
    apply_pagination

    respond_with @scope, api_template: @template, meta: @meta
  end

  def show
    respond_with @xxx, api_template: @template
  end

  def create
    respond_with @xxx, api_template: @template
  end

  def update
    @xxx.update_attributes(update_params)
    respond_with @xxx, api_template: @template
  end

  def destroy
    @xxx.destroy
    respond_with @xxx, api_template: @template
  end

  private

  def filter_params
    # params.slice()
  end

  def order_params
    # get_order_params([])
  end

  def create_params
    params.require(:xxx).permit!
  end

  def update_params
    params.require(:xxx).permit!
  end
end
