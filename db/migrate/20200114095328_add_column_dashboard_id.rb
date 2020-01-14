class AddColumnDashboardId < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :dashboard_id, :integer
  end
end
