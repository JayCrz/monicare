class AddNameTelAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :tel, :integer
    add_column :users, :address, :string

  end
end
