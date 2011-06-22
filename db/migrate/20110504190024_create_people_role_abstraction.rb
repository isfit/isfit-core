class CreatePeopleRoleAbstraction < ActiveRecord::Migration
  def self.up
    create_table :people_role_abstractions, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :person_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :people_role_abstraction
  end
end

