class ApiController < BabyclassAppliciationController
  def search
    serach_value = params[:serach_value]
    teacher = current_teacher
    student = teacher.children.where("name like '%#{serach_value}%'")
    render json: student
  end

  def notification
  end 
end  
