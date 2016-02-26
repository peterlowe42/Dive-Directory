class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text   :body
      t.integer :rating
      t.references :user
      t.references :dive_site
      t.string  :source_id

      t.timestamps
    end
  end
end
