class Teacher::EatController < BabyclassAppliciationController
  before_action :find_student
  before_action :find_eat_dashboard, only: [:edit, :update, :destroy]

  def new
    @meal_dashboard = Dashboard.new
  end

  def create
    @meal_dashboard = Dashboard.new(eat_params)
    if @meal_dashboard.save
      redirect_to teacher_dashboard_child_path(id: params[:child_id], anchor: 'meal'), notice: '新增成功'
    else  
      render :new
    end
  end

  def edit
  end

  def update
    if @meal_dashboard.update(eat_params)
      redirect_to teacher_dashboard_child_path(id: params[:child_id], anchor: 'meal'), notice: '更新成功'
    else
      render :edit
    end
  end
      
  def destroy
    redirect_to teacher_dashboard_child_path(id: params[:child_id], anchor: 'meal') if @meal_dashboard.destroy
  end

  private
  def find_student
    @student = Child.find(params[:child_id])
  end

  def eat_params
    params.require(:dashboard).permit(:title, 
                                      :content, 
                                      :finished_at,
                                      :category,
                                      :child_id,
                                      :admin_sign)
  end

  def find_eat_dashboard
    @meal_dashboard = Dashboard.find(params[:id])
  end
end
