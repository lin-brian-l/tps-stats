class AddAuthorIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column(:entries, :author_id, :string)
  end
end
