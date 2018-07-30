class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.text :test

      t.timestamps
    end
  end
end
