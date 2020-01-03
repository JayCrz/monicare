class Teacher::MiscController < BabyclassAppliciationController
  before_action :find_misc, only:[:edit,:update,:destroy]
  before_action :find_student, only:[:new,:edit]

  def new
  end

  def create
    @misc = Dashboard.new(misc_params)
    if @misc.save
      redirect_to teacher_dashboard_child_path(params[:child_id]), notice: '新增成功'
    else
      render :new, notice: '輸入錯誤請，重新輸入'
    end
  end

  def edit
  end

  def update
    if @find_misc.update(misc_params)
      redirect_to teacher_dashboard_child_path(params[:child_id]), notice: '更新成功'
    else
      render :edit, notice: '輸入錯誤請，重新輸入'
    end
  end

  def destroy
    redirect_to teacher_dashboard_child_path(params[:child_id]), notice: '刪除成功' if @find_misc.destroy
  end

  private
  def misc_params
    params.require(:dashboard).permit(:title,
                                      :content,
                                      :finished_at,
                                      :category,
                                      :child_id)
  end

  def find_misc
    @find_misc = Dashboard.find(params[:id])
  end

  def find_student
    @student = Child.find(params[:child_id])
  end
end
