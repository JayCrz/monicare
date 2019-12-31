class DashboardsController < UserRedirectController
  before_action :authenticate_user!
  def show
    @children = current_user.children
  end
end  