class GroupPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_players do |t|
      t.integer :player_id
      t.integer :group_id

      t.timestamps
    end
  end
end
