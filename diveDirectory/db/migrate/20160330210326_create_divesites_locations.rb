class CreateDivesiteLocations < ActiveRecord::Migration
  def change
    create_table :divesites_locations do |t|
      t.references :divesite
      t.references :location

      t.timestamps
    end
  end
end
