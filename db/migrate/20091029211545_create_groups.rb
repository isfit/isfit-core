class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name_en
      t.string :name_no
      t.integer :section_id
      t.integer :festival_id
    end
  end

  def self.down
    drop_table :groups
  end
end
