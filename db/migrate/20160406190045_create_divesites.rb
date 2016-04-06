class CreateDivesites < ActiveRecord::Migration
  def change
    create_table :divesites do |t|
      t.string :site_name
      t.string :lat
      t.string :lng
      t.string :source_id
      t.integer :max_depth
      t.integer :min_depth
      
      t.timestamps null: false
    end
  end
end
