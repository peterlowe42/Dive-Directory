class CreateLocaitons < ActiveRecord::Migration
  def change
    create_table :locaitons do |t|
      t.string :name
      t.string :lat 
      t.string :lng
      
      t.timestamps
    end
  end
end
