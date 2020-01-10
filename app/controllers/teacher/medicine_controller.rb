class Teacher::MedicineController < BabyclassAppliciationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :find_dashboard, only: [:show, :edit, :update]

  def show
  end
  def edit
  end

  def update
    if @medicine_dashboard.update(medicine_params)
      image = decode_base64_image(params[:dashboard][:admin_sign])
      @medicine_dashboard.update_attribute(:admin_sign, image)
      redirect_to teacher_dashboard_child_medicine_path, notice: '更新成功'
    else
      render :edit, notice: '更新失敗，餵藥品者請簽名'
    end
  end
  
  private
  def medicine_params
    params.require(:dashboard).permit(:admin_sign, :finished_at)
  end

  def find_student
    @student = Child.find(params[:child_id])
  end

  def find_dashboard
    @medicine_dashboard = @student.dashboards.medicine.find(params[:id])
  end

  def decode_base64_image(encoded_file)
    image_source = encoded_file.split(',').last
    decoded_file = Base64.decode64(image_source)
    file = Tempfile.new(['image','.png'])
    file.binmode
    file.write decoded_file
    return file
  end
end

