class AlterPeopleToUsers < ActiveRecord::Migration
  def up
    execute "DROP TABLE users"
    execute "ALTER TABLE people RENAME TO users"
    add_column :users, :password_digest, :string
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    
    execute "ALTER TABLE people_positions CHANGE person_id user_id int(11)"
    execute "ALTER TABLE people_positions RENAME TO positions_users"
    execute "ALTER TABLE people_role_abstractions CHANGE person_id user_id int(11)"
    execute "ALTER TABLE people_role_abstractions RENAME TO users_role_abstractions"
    execute "ALTER TABLE people_roles CHANGE person_id user_id int(11)"
    execute "ALTER TABLE people_roles RENAME TO users_roles"
    execute "ALTER TABLE positions CHANGE person_id user_id int(11)"

  end

  def down
    
  end
end
