class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :title_en
      t.string :title_no
      t.integer :person_id
    end
  end

  def self.down
    drop_table :positions
  end
end
