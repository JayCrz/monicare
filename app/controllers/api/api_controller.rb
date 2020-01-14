class Api::ApiController < ApplicationController
  before_action :serach_value, only:[:search,:search_dashboard]
  def search
    teacher = current_teacher
    student = teacher.children.where("name like '%#{serach_value}%'")
    render json: student
  end

  def search_dashboard
    child = Child.find(params[:child_id])
    dashboards = child.dashboards.where("finished_at IS NOT NULL")
    dashboard_resp = []
    dashboards.order(finished_at: :desc).each do |dashboard|
      id = dashboard.id.to_s
      title = dashboard.title
      date = dashboard.finished_at.to_date.to_s
      content = dashboard.content
      category = dashboard.category
      child_id = dashboard.child_id
      if date.include?(serach_value)
        data = [title, date, content, id, category, child_id]
        dashboard_resp << data
      end
    end

    render json: dashboard_resp
  end

  def notification
    teacher_ids = params['notification']['teacher_id'].split(' ').map(&:to_i)
    dashboard_id = Dashboard.last.id + 1
    teacher_ids.each do |teacher|
      Notification.create(title: params['notification']['title'], teacher_id: teacher, user_id: params['notification']['user_id'], child_id: params['notification']['child_id'], dashboard_id: dashboard_id )
    end
  end 

  private
  def serach_value
    serach_value = params[:serach_value]
  end

  def notification_params
    params.require(:notification).permit(:title,
                                         :teacher_id,
                                         :user_id,
                                         :read,
                                         :child_id,
                                         :dashboard_id)
  end
end  
