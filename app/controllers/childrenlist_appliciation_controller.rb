class ChildrenlistAppliciationController < ApplicationController
  before_action :children_list

  private
  def children_list
    @children_list = User.first.children
  end
end