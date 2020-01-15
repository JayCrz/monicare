class Teacher::PickUpController < BabyclassAppliciationController
  def show
    @student = Child.find(params[:child_id])
    @pick_up = @student.pick_ups.find(params[:id])
    Notification.where(child_id: params[:child_id], pick_up_id: params[:id]).update(teacher_read: true, user_read: true)
  end
end