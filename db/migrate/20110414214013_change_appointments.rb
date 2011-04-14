class ChangeAppointments < ActiveRecord::Migration
  def self.up
    remove_index :appointments, :currency_id
    remove_column :appointments, :currency_id
    remove_column :appointments, :visited

    add_column :appointments, :user_id, :integer, :null => false
    add_index :appointments, [:country_id, :user_id], :unique => true
  end

  def self.down
    remove_index :appointments, [:country_id, :user_id]
    remove_column :appointments, :user_id

    add_column :appointments, :visited, :boolean, :default => false, :null => false
    add_column :appointments, :currency_id, :integer, :null => false
    add_index :appointments, :currency_id
  end
end
