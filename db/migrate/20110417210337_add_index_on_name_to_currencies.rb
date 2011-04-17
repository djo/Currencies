class AddIndexOnNameToCurrencies < ActiveRecord::Migration
  def self.up
    add_index :currencies, :name
  end

  def self.down
    remove_index :currencies, :name
  end
end
