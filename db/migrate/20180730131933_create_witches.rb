class CreateWitches < ActiveRecord::Migration[5.2]
  def change
    create_table :witches do |t|
      t.integer :win
      t.integer :lose

      t.timestamps
    end
  end
end
