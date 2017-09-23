module EntryControllerHelper
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    halt(404, erb(:'404')) if entry.nil?
    entry
  end
end

helpers EntryControllerHelper


def change
    create_table :entries do |t|
      t.string :title, { limit: 64, null: false }
      t.text :body, { null: false }
      t.integer :author_id, {null: false}

      t.timestamps
    end
  end
