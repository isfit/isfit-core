class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name_en
      t.string :name_no
      t.integer :festival_id
    end
  end

  def self.down
    drop_table :sections
  end
end
