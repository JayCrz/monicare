class AddChildToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :child, foreign_key: true
  end
end
