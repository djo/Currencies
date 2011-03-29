class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.boolean :visited, :default => false, :null => false

      t.integer :currency_id, :null => false
      t.integer :country_id, :null => false

      t.timestamps
    end

    add_index :appointments, :currency_id
    add_index :appointments, :country_id
  end

  def self.down
    remove_index :appointments, :currency_id
    remove_index :appointments, :country_id

    drop_table :appointments
  end
end
