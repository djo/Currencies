class ChangeCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :currency_id, :integer, :null => false
    add_index :countries, :currency_id
    add_index :countries, :name
  end

  def self.down
    remove_index :countries, :name
    remove_index :countries, :currency_id
    remove_column :countries, :currency_id
  end
end
