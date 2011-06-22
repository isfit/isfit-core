class AddLdapIdToPeople < ActiveRecord::Migration
  def self.up
    add_column :peoples, :ldap_id, :integer
  end

  def self.down
    remove_column :peoples, :ldap_id
  end
end
