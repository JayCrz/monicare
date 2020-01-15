module ApplicationHelper
  def notification_read_url(notification)
    if notification.dashboard_id != nil
     "/teacher/dashboard/children/#{notification.child_id}/#{notification.user.children.find(notification.child_id).dashboards.find(notification.dashboard_id).category}/#{notification.dashboard_id}"
    else
      "/teacher/dashboard/children/#{notification.child_id}/pick_up/#{notification.pick_up_id}"
    end
  end
end
