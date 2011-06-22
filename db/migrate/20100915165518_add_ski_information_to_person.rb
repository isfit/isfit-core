class AddSkiInformationToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :has_skies, :integer
    add_column :people, :shoe_size, :integer
  end

  def self.down
    remove_column :people, :shoe_size
    remove_column :people, :has_skies
  end
end
