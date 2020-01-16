class ChildrenController < ChildrenlistAppliciationController
  def new
  end

  def create
  end
  
  def show
    @child = Child.find(params[:id])
    @pick_ups = @child.pick_ups
    @dashboards_medicine = @child.dashboards.order(started_at: :desc).medicine.reduce({}) do |rs, dm|
      date = dm.started_at.strftime('%Y-%m-%d')
      rs[date] ||= []
      rs[date] << dm
      rs
    end
    @dashboards_meal = @child.dashboards.order(finished_at: :desc).eat.reduce({}) do |rs, dm|
      date = dm.finished_at.strftime('%Y-%m-%d')
      rs[date] ||= []
      rs[date] << dm
      rs
    end
    @dashboards_misc = @child.dashboards.order(finished_at: :desc).misc.reduce({}) do |rs, dm|
      date = dm.finished_at.strftime('%Y-%m-%d')
      rs[date] ||= []
      rs[date] << dm
      rs
    end
  end

  def overview
    @child = Child.find(params[:child_id])
    @dashboards = @child.dashboards.where('finished_at IS NOT NULL').order(finished_at: :desc).reduce({}) do |rs,dm|
      date = dm.finished_at.strftime('%Y-%m-%d')
      rs[date] ||= []
      rs[date] << dm
      rs
    end
  end
    
  def index 
  end

  private
  def child_params
    params.require(:child).permit(:name, :babyclass_id, :user_id)
  end
end
