class AddCityToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :city, :string
  end

  def self.down
    remove_column :people, :city
  end
end
