class AddUserToNecromancers < ActiveRecord::Migration[5.2]
  def change
    add_reference :necromancers, :user, foreign_key: true
  end
end
