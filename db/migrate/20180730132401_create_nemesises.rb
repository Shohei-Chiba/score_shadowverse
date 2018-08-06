class CreateNemesises < ActiveRecord::Migration[5.2]
  def change
    create_table :nemesises do |t|
      t.integer :win
      t.integer :lose

      t.timestamps
    end
  end
end
