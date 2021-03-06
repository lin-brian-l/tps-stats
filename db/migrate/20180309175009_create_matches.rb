class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :group_id
      t.string :round_short, { null: false }
      t.string :round_full, { null: false }
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_score
      t.integer :loser_score
      t.integer :loser_placing
      t.integer :winner_placing
      t.string :match_duration
      t.string :match_vods

      t.timestamps
    end 
  end
end
