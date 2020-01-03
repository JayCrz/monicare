class Teacher::DashboardsController < BabyclassAppliciationController

  def show
    @teacher = current_teacher
    @students = @teacher.children
  end

  def student
    @student = Child.find(params[:id])
    @pick_ups = @student.pick_ups
    @dashboards = @student.dashboards.medicine
  end
end
