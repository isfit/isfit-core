class AddPressInfoToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :media_contacts, :text
    add_column :people, :local_paper, :string
  end

  def self.down
    remove_column :people, :local_paper
    remove_column :people, :media_contacts
  end
end
