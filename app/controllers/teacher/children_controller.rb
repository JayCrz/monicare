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

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add teacher view overview (#26)
  def overview
    @student = Child.find(params[:child_id])
    @dashboards = @student.dashboards.where('finished_at IS NOT NULL')
  end
<<<<<<< HEAD

  private
=======
  private

>>>>>>> changed regist design
=======

  private
>>>>>>> add teacher view overview (#26)
  def child_params
    params.require(:child).permit(:name, 
                                  :user_id, 
                                  :babyclass_id)
  end
end
