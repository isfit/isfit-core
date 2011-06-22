class CreateGroupsPositions < ActiveRecord::Migration
  def self.up
    create_table :groups_positions, :id => false do |t|
      t.integer :group_id
      t.integer :position_id
    end
  end

  def self.down
    drop_table :groups_positions
  end
end
