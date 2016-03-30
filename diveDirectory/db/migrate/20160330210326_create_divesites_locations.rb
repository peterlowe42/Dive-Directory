class CreateDivesitesLocations < ActiveRecord::Migration
  def change
    create_table :divesites_locations do |t|
      t.references :divesite
      t.references :location
    end
  end
end
