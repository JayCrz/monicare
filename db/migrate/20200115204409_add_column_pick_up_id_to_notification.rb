class AddColumnPickUpIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :pick_up_id, :integer
  end
end
