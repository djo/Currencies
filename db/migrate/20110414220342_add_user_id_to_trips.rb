class AddUserIdToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :user_id, :integer, :null => false
    add_index :trips, :user_id
  end

  def self.down
    remove_index :trips, :user_id
    remove_column :trips, :user_id
  end
end
