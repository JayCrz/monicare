class Teacher::DashboardsController < ApplicationController
  before_action :baby_class
  def show
    @teacher = current_teacher
    @students = @teacher.children.distinct
  end

  def student
    @student = Child.find(params[:id])
    @pick_ups = @student.pick_ups
    @dashboards = @student.dashboards.medicine
  end
  


  def medicine
    
  end


  private
  
  def baby_class
    @babyclass = Babyclass.all
  end
end