class AddUserToDragons < ActiveRecord::Migration[5.2]
  def change
    add_reference :dragons, :user, foreign_key: true
  end
end
