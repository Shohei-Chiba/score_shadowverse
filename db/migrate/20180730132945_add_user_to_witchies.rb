class AddUserToWitchies < ActiveRecord::Migration[5.2]
  def change
    add_reference :witchies, :user, foreign_key: true
  end
end
