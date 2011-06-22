class AddDescriptionToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :description_en, :text
    add_column :positions, :description_no, :text
  end

  def self.down
    remove_column :positions, :description_en
    remove_column :positions, :description_no

  end
end
