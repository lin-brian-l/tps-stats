class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.integer :event_id
      t.string :name

      t.timestamps
    end
  end
end
