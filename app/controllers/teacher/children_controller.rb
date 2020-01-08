class Teacher::ChildrenController < BabyclassAppliciationController

  def new
    @child = Child.new
    @dashboard = Dashboard.new
  end

  def create
    @child = Child.new(child_params)

    if @child.save 
      redirect_to teacher_dashboard_path, notice: '新增成功'
      current_teacher.children << Child.last
    else
      render :new
    end
  end

  def show
    @student = Child.find(params[:id])
    @dashboards = @student.dashboards
    @pick_ups = @student.pick_ups
  end

  def overview
    @student = Child.find(params[:child_id])
    @dashboards = @student.dashboards.where('finished_at IS NOT NULL')
  end

  private
  def child_params
    params.require(:child).permit(:name, 
                                  :user_id, 
                                  :babyclass_id)
  end
end
