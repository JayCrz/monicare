class TeachersController < ApplicationController
  def index
    @student = Child.all
  end

  def student
    @student = Child.find(params[:id])
  end
end
