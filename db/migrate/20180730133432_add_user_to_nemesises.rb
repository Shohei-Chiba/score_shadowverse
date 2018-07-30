class AddUserToNemesises < ActiveRecord::Migration[5.2]
  def change
    add_reference :nemesises, :user, foreign_key: true
  end
end
