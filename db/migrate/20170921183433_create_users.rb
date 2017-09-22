class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :username, { limit: 64, null: false }
      t.string  :email , { null: false }
      t.string  :encrypted_password
    end
  end
end
