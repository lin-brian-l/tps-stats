class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :phase_id
      t.string :name
      t.integer :smash_gg_group_id

      t.timestamps
    end
  end
end
