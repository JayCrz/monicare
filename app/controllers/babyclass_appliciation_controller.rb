class BabyclassAppliciationController < ApplicationController
  before_action :authenticate_teacher!
  before_action :baby_class
  
  private
  def baby_class
    @babyclass = Babyclass.all
  end
end
