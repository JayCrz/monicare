class ChildrenController < ChildrenlistAppliciationController
  def new
  
  end

  def create
   
  end
  
  def show
    @child = Child.find(params[:id])
    @pick_ups = @child.pick_ups
    @dashboards = @child.dashboards
  end

  def overview
    @child = Child.find(params[:child_id])
    @dashboards = @child.dashboards.where('finished_at IS NOT NULL')

  end
    
  def index 
  end

  private
  def child_params
    params.require(:child).permit(:name, :babyclass_id, :user_id)
  end
end
