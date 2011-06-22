class AddStuffToPeoplePositions < ActiveRecord::Migration
  def self.up
    add_column :people_positions, :person_id, :integer
    add_column :people_positions, :position_id, :integer
  end

  def self.down
    remove_column :people_positions, :position_id
    remove_column :people_positions, :person_id
  end
end
