class BabyclassAppliciationController < ApplicationController
  before_action :authenticate_teacher!
  before_action :baby_class
  
  private
  def baby_class
    @babyclass = Babyclass.all
  end

  # def after_sign_in_path_for(resource)
  #   teacher_dashboard_myclass_path
  # end
end
