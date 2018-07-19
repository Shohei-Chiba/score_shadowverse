class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :memo
      t.string :picture

      t.timestamps
    end
  end
end
