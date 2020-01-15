class Teacher::MiscController < BabyclassAppliciationController
  before_action :find_misc_dashboard, only: [:edit, :update, :destroy]
  before_action :find_student

  def new
    @misc_dashboard = Dashboard.new
  end

  def create
    @misc_dashboard = Dashboard.new(misc_params)
    if @misc_dashboard.save
      redirect_to teacher_dashboard_child_path(params[:child_id], anchor: 'misc'), notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @misc_dashboard.update(misc_params)
      redirect_to teacher_dashboard_child_path(params[:child_id], anchor: 'misc'), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    redirect_to teacher_dashboard_child_path(params[:child_id], anchor: 'misc') if @misc_dashboard.destroy
  end

  private
  def misc_params
    params.require(:dashboard).permit(:title,
                                      :content,
                                      :finished_at,
                                      :category,
                                      :child_id,
                                      :admin_sign)
  end

  def find_misc_dashboard
    @misc_dashboard = Dashboard.find(params[:id])
  end

  def find_student
    @student = Child.find(params[:child_id])
  end
end
