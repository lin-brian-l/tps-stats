class AddEntryId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :entry_id, :integer
  end
end
