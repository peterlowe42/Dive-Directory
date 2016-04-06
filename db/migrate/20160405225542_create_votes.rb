class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean  :up
      t.integer :votable_id
      t.string  :votable_type
    end
  end
end
