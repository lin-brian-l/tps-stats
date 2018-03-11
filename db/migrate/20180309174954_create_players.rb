class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :gamer_tag, { null: false }
      t.string :sponsor
      t.integer :user_id
      t.integer :smash_gg_player_id

      t.timestamps
    end
  end
end