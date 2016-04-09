class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :divesite
      t.integer :rating
      t.string :title
      t.text :body
      t.date :dive_date
      t.integer :vis
      t.integer :temp 
      t.string :current
      t.string :waves


      t.timestamps null: false
    end
  end
end
