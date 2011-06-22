class CreateRolesSections < ActiveRecord::Migration
  def self.up
    create_table :roles_sections, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :section_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :roles_sections
  end
end

