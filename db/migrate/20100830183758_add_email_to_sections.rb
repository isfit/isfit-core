class AddEmailToSections < ActiveRecord::Migration
  def self.up
    add_column :sections, :email, :string
  end

  def self.down
    remove_column :sections, :email
  end
end
