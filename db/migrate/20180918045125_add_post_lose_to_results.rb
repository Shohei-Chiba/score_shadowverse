class AddPostLoseToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :post_lose, :integer
  end
end
