class CreateDiveSites < ActiveRecord::Migration
  def change
    create_table :dive_sites do |t|
      t.string :name
      t.string :lat
      t.string :long
      t.integer :min_depth
      t.integer :max_depth

      t.timestamps
    end
  end
end
