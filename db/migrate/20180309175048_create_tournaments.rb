class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, { null: false }
      t.date :date
      t.string :link

      t.timestamps
    end
  end
end
