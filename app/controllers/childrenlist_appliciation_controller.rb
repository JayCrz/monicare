class ChildrenlistAppliciationController < ApplicationController
  before_action :children_list
  before_action :notification

  private
  def children_list
    @children_list = User.first.children
  end

  def notification
    @notification = Notification.where(teacher_read: true, user_read: false)
  end
end