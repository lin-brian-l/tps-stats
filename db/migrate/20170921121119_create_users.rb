class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, uniqueness: true
      t.string :password_hash, presence: true

      t.timestamps
    end
  end
end
