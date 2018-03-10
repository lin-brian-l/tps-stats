class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :event_id
      t.string :round_short, { null: false }
      t.string :round_full, { null: false }
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_score
      t.integer :loser_score

      t.timestamps
    end 
  end
end
