class AddUserToBishops < ActiveRecord::Migration[5.2]
  def change
    add_reference :bishops, :user, foreign_key: true
  end
end
