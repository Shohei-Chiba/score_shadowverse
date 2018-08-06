class AddUserToWitches < ActiveRecord::Migration[5.2]
  def change
    add_reference :witches, :user, foreign_key: true
  end
end
