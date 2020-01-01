class Teacher::ChildrenController < BabyclassAppliciationController

  def new
    @student = Child.new
  end

  def create
   
  end

  def show
    @student = Child.find(params[:id])
    @dashboards = @student.dashboards
  end

end