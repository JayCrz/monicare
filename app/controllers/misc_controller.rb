class MiscController < ApplicationController
  def show
    @misc_dashboards = Dashboard.find(params[:id])
  end
end