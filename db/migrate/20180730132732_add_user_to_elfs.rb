class AddUserToElfs < ActiveRecord::Migration[5.2]
  def change
    add_reference :elfs, :user, foreign_key: true
  end
end
