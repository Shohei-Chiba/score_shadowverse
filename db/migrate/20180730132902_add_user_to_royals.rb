class AddUserToRoyals < ActiveRecord::Migration[5.2]
  def change
    add_reference :royals, :user, foreign_key: true
  end
end
