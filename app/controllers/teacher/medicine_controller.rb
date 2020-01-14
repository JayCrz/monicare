class Teacher::MedicineController < BabyclassAppliciationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :find_dashboard, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    image = decode_base64_image(medicine_params[:admin_sign])
    @medicine_dashboard.assign_attributes( medicine_params.merge(admin_sign: image, want_to_check_admin_sign: true) )
    if @medicine_dashboard.save
      redirect_to teacher_dashboard_child_medicine_path, notice: '更新成功'
    else
      flash.now[:alert] = "餵藥完成請簽署"
      render :edit
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
    if image_source
      decoded_file = Base64.decode64(image_source)
      file = Tempfile.new(['image','.png'])
      file.binmode
      file.write decoded_file
      return file
    else
    end
  end
end

