class CreateDivesites < ActiveRecord::Migration
  def change
    create_table :dive_sites do |t|
      t.string :site_name
      t.string :lat
      t.string :lng
      t.integer :max_depth
      t.integer :min_depth
      
      t.timestamps null: false
    end
  end
end
