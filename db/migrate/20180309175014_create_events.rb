class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :tournament_id
      t.string :name, { null: false }
      t.string :smash_gg_link
      t.string :banner_image

      t.timestamps
    end
  end
end
