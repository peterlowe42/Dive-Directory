class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_hash
      t.integer :no_of_dives
      t.string :pic_url

      t.timestamps null: false
    end
  end
end
