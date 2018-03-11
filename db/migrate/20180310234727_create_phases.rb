class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.integer :event_id
      t.string :name
      t.integer :smash_gg_phase_id

      t.timestamps
    end
  end
end
