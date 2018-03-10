class CreateTournamentAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_attendees do |t|
      t.integer :tournament_id
      t.integer :player_id
      t.boolean :media
      t.boolean :spectator
      t.boolean :competitor
      t.boolean :facilitator

      t.timestamps
    end
  end
end
