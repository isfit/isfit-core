class AddFieldsToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :date_of_birth, :date
    add_column :people, :gender, :integer
    add_column :people, :phone, :string
    add_column :people, :address, :string
    add_column :people, :postal_code, :integer
    add_column :people, :country_id, :integer
    add_column :people, :next_of_kin_name, :string
    add_column :people, :next_of_kin_tlf, :string
    add_column :people, :tasks, :text
    add_column :people, :study, :string
    add_column :people, :study_place_id, :integer
    add_column :people, :private_email, :string
    add_column :people, :cardnumber_ntnu, :integer
    add_column :people, :cardnumber_samfundet, :integer
  end

  def self.down
    remove_column :people, :cardnumber_samfundet
    remove_column :people, :cardnumber_ntnu
    remove_column :people, :private_email
    remove_column :people, :study_place_id
    remove_column :people, :study
    remove_column :people, :tasks
    remove_column :people, :next_of_kin_tlf
    remove_column :people, :next_of_kin_name
    remove_column :people, :country_id
    remove_column :people, :postal_code
    remove_column :people, :address
    remove_column :people, :phone
    remove_column :people, :gender
    remove_column :people, :date_of_birth
  end
end
