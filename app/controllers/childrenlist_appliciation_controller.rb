class ChildrenlistAppliciationController < ApplicationController
  before_action :children_list
  before_action :notification

  private
  def children_list
    @children_list = current_user.children
  end

  def notification
    @notification = current_user.notifications.where(teacher_read: true, user_read: false)
  end
end