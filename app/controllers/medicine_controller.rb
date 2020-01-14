class MedicineController < ChildrenlistAppliciationController
  before_action :find_child, only:[:new, :edit, :show]
  before_action :find_medicine, only:[:show, :edit, :update, :destroy]
  def new
    @medicine = Dashboard.new
  end

  def create
    image = decode_base64_image(params[:dashboard][:parent_sign])
    @medicine = Dashboard.new(medicine_params)
    @medicine.parent_sign = image
    
    if @medicine.save
      redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine'), notice: '新增成功'
    else
      find_child
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:dashboard][:parent_sign].split('/').last != @find_medicine[:parent_sign]
      @find_medicine.update(medicine_params)
      image = decode_base64_image(params[:dashboard][:parent_sign])
      @find_medicine.update_attribute(:parent_sign, image)
      redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine'), notice: '更新成功'
    else
      find_child
      flash.now[:alert] = "請重新簽署"
      render :edit
    end
  end

  def destroy
    redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine') if @find_medicine.destroy
  end 
  
  private
  def medicine_params
    params.require(:dashboard).permit(:title,
                                      :started_at,
                                      :content,
                                      :parent_sign,
                                      :category,
                                      :child_id)
  end

  def find_medicine
    @find_medicine = Dashboard.find(params[:id])
  end 

  def find_child
    @find_child = Child.find(params[:child_id])
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
