class Teacher::MyclassController < BabyclassAppliciationController

  def new

  end

  def create
    myclass = Babyclass.create(nursery_class: class_params['nursery_class'])
    class_teacher = ClassTeacher.create(babyclass_id: Babyclass.last.id, teacher_id: class_params['teacher_id'])
    redirect_to teacher_dashboard_myclass_path(Babyclass.last.id)
  end

  def show
    @myclass = Babyclass.find(params[:id])
    @students = @myclass.children
  end

  private
  def class_params
    params.require(:class).permit(:nursery_class, :teacher_id)
  end
end
