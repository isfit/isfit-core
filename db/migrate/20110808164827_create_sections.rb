class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name_en
      t.string :name_no
      t.integer :festival_id
      t.string :email
      t.string :tag
      t.text :description_en
      t.text :description_no

      t.timestamps
    end
  end
end
