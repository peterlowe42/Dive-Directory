class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :pic_url
      t.string :activation_digest
      t.boolean :activated, default: false
      t.string :units

      t.timestamps null: false
    end
  end
end
