class MedicineController < ChildrenlistAppliciationController
  before_action :find_child, only:[:new,:edit]
  before_action :find_medicine, only:[:edit,:update,:destroy]
  def new
  end

  def create
    image = decode_base64_image(params[:dashboard][:parent_sign])
    @medicine = Dashboard.new(medicine_params)
    @medicine.parent_sign = image

    redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine'),notice: '新增成功' if	@medicine.save
  end

  def edit
  end

  def update
    if @find_medicine.update(medicine_params)
      image = decode_base64_image(params[:dashboard][:parent_sign])
      @find_medicine.update_attribute(:parent_sign, image)
      redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine'), notice: '更新成功'
    else
      render :edit,notice: '更新錯誤,請重新輸入'
    end
  end

  def destroy
    redirect_to dashboard_child_path(params[:child_id], anchor: 'feed-medicine'), notice: '資料已刪除' if @find_medicine.destroy
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
    decoded_file = Base64.decode64(image_source)
    file = Tempfile.new(['image','.png'])
    file.binmode
    file.write decoded_file
    return file
  end
end
