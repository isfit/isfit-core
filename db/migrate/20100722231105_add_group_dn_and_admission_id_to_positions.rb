class AddGroupDnAndAdmissionIdToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :group_dn, :string
    add_column :positions, :admission_id, :integer
  end

  def self.down
    remove_column :positions, :admission_id
    remove_column :positions, :group_dn
  end
end
