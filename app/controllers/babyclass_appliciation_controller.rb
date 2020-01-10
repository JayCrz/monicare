class BabyclassAppliciationController < ApplicationController
  before_action :authenticate_teacher!
  before_action :baby_class
  
  layout 'backend'

  private
  def baby_class
    @babyclass = current_teacher.babyclasses
  end
end
