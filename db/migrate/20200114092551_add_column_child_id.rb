class AddColumnChildId < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :child_id, :integer
  end
end
