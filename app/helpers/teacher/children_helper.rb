module Teacher::ChildrenHelper
  def teacher_redirect_to(dashboard)
    if dashboard.category != 'medicine' 
      "#{dashboard.category}/#{dashboard.id}/edit"
    else
      "#{dashboard.category}/#{dashboard.id}"
    end
  end
end
