class BabyclassAppliciationController < ApplicationController
  before_action :authenticate_teacher!
  before_action :baby_class
  before_action :notification
  
  layout 'backend'

  private
  def baby_class
    @babyclass = current_teacher.babyclasses
  end

  def notification 
    @notification = Notification.where(teacher_read: false, user_read: false, teacher_id: current_teacher.id)
  end
end
