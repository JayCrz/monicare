class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @children = current_user.children
  end
end  
