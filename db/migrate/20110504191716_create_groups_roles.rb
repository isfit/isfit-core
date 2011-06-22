class CreateGroupsRoles < ActiveRecord::Migration
  def self.up
    create_table :groups_roles, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :group_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :groups_roles
  end
end

