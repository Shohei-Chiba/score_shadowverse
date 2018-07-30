class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon, :string
    add_column :users, :bio, :string
  end
end
