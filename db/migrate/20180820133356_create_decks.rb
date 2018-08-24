class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :mydeck
      t.string :Opponentdeck
      t.string :Ahead
      t.string :result

      t.timestamps
    end
  end
end
