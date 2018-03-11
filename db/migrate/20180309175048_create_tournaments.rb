class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, { null: false }
      t.date :date
      t.string :link
      t.integer :smash_gg_tournament_id

      t.timestamps
    end
  end
end
