class AddAuthorColumnToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :author_id, :integer
  end
end
