class AddGroupCardToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :have_group_card, :integer
  end

  def self.down
    remove_column :people, :have_group_card
  end
end
