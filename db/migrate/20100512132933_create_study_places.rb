class CreateStudyPlaces < ActiveRecord::Migration
  def self.up
    create_table :study_places do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :study_places
  end
end
