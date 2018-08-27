class AddIdToResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :results, :deck, foreign_key: true
  end
end
