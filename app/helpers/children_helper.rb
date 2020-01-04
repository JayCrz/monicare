module ChildrenHelper
  def parent_redirect_to(dashboard)
    if dashboard.category == 'medicine'
      "/dashboard/children/#{dashboard.child_id}/#{dashboard.category}/#{dashboard.id}/edit"
    else
     "/dashboard/children/#{dashboard.child_id}/#{dashboard.category}/#{dashboard.id}"
    end
  end
end
