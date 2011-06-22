class CreateFestivals < ActiveRecord::Migration
  def self.up
    create_table :festivals do |t|
      t.integer :year
    end
  end

  def self.down
    drop_table :festivals
  end
end
