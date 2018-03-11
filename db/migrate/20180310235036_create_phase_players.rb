class CreatePhasePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :phase_players do |t|
      t.integer :player_id
      t.integer :phase_id

      t.timestamps
    end
  end
end
