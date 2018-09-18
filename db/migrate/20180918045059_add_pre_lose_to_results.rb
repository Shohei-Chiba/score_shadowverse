class AddPreLoseToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :pre_lose, :integer
  end
end
