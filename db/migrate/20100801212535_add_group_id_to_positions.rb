class AddGroupIdToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :group_id, :integer
  end

  def self.down
  end
end
