class CreateDiveSites < ActiveRecord::Migration
  def change
    create_table :dive_sites do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.integer :max_depth
      t.integer :min_depth
      t.string :source_id

      t.timestamps
    end
  end
end
