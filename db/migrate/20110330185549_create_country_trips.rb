class CreateCountryTrips < ActiveRecord::Migration
  def self.up
    create_table :country_trips do |t|
      t.integer :country_id, :null => false
      t.integer :trip_id, :null => false

      t.timestamps
    end

    add_index :country_trips, [:country_id, :trip_id], :unique => true
  end

  def self.down
    remove_index :country_trips, :column => [:country_id, :trip_id]
    drop_table :country_trips
  end
end
