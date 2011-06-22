class CreateFestivalsRoles < ActiveRecord::Migration
  def self.up
    create_table :festivals_roles, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :festival_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :festivals_roles
  end
end

