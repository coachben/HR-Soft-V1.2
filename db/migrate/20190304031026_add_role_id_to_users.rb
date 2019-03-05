class AddRoleIdToUsers < ActiveRecord::Migration[5.0]
  def change
        add_column :users, :role_id, :integer
  end
end


#The roles table is no longer being used. please consider removing the role_id relationship
#all roles are now directly set in the users table without a need to join role table.
#the migration called add_roles_to_users is what you need. not this one.