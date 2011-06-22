class AddDescriptionsToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :description_en, :text
    add_column :sections, :description_no, :text
  end

  def self.down
    remove_column :sections, :description_no
    remove_column :sections, :description_en
  end
end
