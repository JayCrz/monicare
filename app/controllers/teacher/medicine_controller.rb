class Teacher::MedicineController < BabyclassAppliciationController

  def show
    @student = Child.find(params[:child_id])
    @medicine_dashboard = @student.dashboards.medicine.find(params[:id])
  end
  def edit 
    @student = Child.find(params[:child_id])
    @medicine_dashboard = @student.dashboards.medicine.find(params[:id])
  end

  def update
    @student = Child.find(params[:child_id])
    @medicine_dashboard = @student.dashboards.medicine.find(params[:id])
    if @medicine_dashboard.update(medicine_params)
      redirect_to teacher_dashboard_child_medicine_path, notice:'更新成功'
    else
      render :edit, notice:'更新失敗，餵藥品者請簽名'
    end
  end
  private
  def medicine_params
    params.require(:dashboard).permit(:admin_sign)
  end
end

