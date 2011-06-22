class AddDescriptionsToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :description_en, :text
    add_column :groups, :description_no, :text
  end

  def self.down
    remove_column :groups, :description_no
    remove_column :groups, :description_en
  end
end
