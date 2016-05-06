class CreateDivesiteLocations < ActiveRecord::Migration
  def change
    create_table :divesite_locations do |t|
      t.references :divesite
      t.references :location
      t.string :distance

      t.timestamps null: false
    end
  end
end
