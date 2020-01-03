class EatController < ChildrenlistAppliciationController
  def show
    @child = Child.find(params[:child_id])
    @meal_dashboards = Dashboard.find(params[:id])
  end
end
