class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :pre_win
      t.integer :post_win
      t.integer :lose

      t.timestamps
    end
  end
end
