class AddReaderStatusAndChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :user_read, :boolean, :default => false
    rename_column :notifications, :read, :teacher_read 
  end
end
