class Teacher::ChildrenController < BabyclassAppliciationController

  def new
    @child = Child.new
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
    @dashboards_medicine = @student.dashboards.order(started_at: :desc).medicine.reduce({}) do |rs,dm|
      date = dm.started_at.strftime("%Y-%m-%d")
      rs[date] ||= []
      rs[date] << dm
      rs
    end
    @dashboards_meal = @student.dashboards.order(finished_at: :desc).eat.reduce({}) do |rs,dm|
      date = dm.finished_at.strftime("%Y-%m-%d")
      rs[date] ||= []
      rs[date] << dm
      rs
    end
    @dashboards_misc = @student.dashboards.order(finished_at: :desc).misc.reduce({}) do |rs,dm|
      date = dm.finished_at.strftime("%Y-%m-%d")
      rs[date] ||= []
      rs[date] << dm
      rs
    end
    @pick_ups = @student.pick_ups
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add teacher view overview (#26)
  def overview
    @student = Child.find(params[:child_id])
    @dashboards = @student.dashboards.where('finished_at IS NOT NULL').order(finished_at: :desc).reduce({}) do |rs, dm|
      date = dm.finished_at.strftime("%Y-%m-%d")
      rs[date] ||= []
      rs[date] << dm
      rs
    end
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
                                  :babyclass_id,
                                  :child_pic)
  end
end
