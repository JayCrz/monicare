module ApplicationHelper
  def notification_read_url(notification)
    "/teacher/dashboard/children/#{notification.child_id}/#{notification.user.children.find(notification.child_id).dashboards.find(notification.dashboard_id).category}/#{notification.dashboard_id}"
  end
end
