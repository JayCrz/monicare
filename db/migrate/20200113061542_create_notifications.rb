class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :teacher, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
