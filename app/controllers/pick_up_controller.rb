class PickUpController < ChildrenlistAppliciationController
  before_action :find_child
  before_action :find_pick_up, only: [:show, :edit, :update, :destroy]

  def new
    @pick_up = @child.pick_ups.build
  end
  
  def create
    @pick_up = @child.pick_ups.build(pick_up_params)
    if @pick_up.save
      teacher_ids =  @child.teachers.ids
      pick_up_id = PickUp.last.id
      teacher_ids.each do |teacher|
        Notification.create(title: '有新的接送親友', teacher_id: teacher, user_id: current_user.id, pick_up_id: pick_up_id, child_id: params[:child_id])
      end
      redirect_to dashboard_child_path(@child.id, anchor: 'list-pick-up'), notice: '已新增一位可接送的人'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pick_up.update(pick_up_params)
      redirect_to dashboard_child_path(@child.id, anchor: 'list-pick-up'), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @pick_up.destroy
    redirect_to dashboard_child_path(@child.id, anchor: 'list-pick-up')
  end

  private
  def find_child
    @child = Child.find(params[:child_id])
  end

  def find_pick_up
    @pick_up = @child.pick_ups.find(params[:id])
  end

  def pick_up_params
    params.require(:pick_up)
          .permit(:name, :pick_up_pic, :relationship, :note, :child_id)
  end
end
