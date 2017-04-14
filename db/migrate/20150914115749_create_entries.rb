class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, { limit: 64, null: false }
      t.text :body, { null: false }

      t.timestamps
    end
  end
end
