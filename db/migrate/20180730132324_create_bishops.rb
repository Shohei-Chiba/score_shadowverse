class CreateBishops < ActiveRecord::Migration[5.2]
  def change
    create_table :bishops do |t|
      t.integer :win
      t.integer :lose

      t.timestamps
    end
  end
end
