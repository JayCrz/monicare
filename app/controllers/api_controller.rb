class ApiController < ApplicationController
  before_action :serach_value, only:[:search,:search_dashboard]
  def search
    teacher = current_teacher
    student = teacher.children.where("name like '%#{serach_value}%'")
    render json: student
  end

  def search_dashboard
    child = Child.find(params[:child_id])
    dashboards = child.dashboards.where("finished_at IS NOT NULL")
    # date = dashboards.where("finished_at like '#{Date.parse(serach_value)}'")
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
  end 

  private
  def serach_value
    serach_value = params[:serach_value]
  end
end  
