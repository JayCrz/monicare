class MiscController < ApplicationController
  def show
    @child = Child.find(params[:child_id])
    @misc_dashboards = Dashboard.find(params[:id])
  end
end