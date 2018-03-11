class CreateEventEntrants < ActiveRecord::Migration[5.0]
  def change
    create_table :event_entrants do |t|
      t.integer :player_id
      t.integer :event_id

      t.timestamps
    end
  end
end
