class RenameMemberPassword < ActiveRecord::Migration
  def up
   rename_column :members, :password, :password_digest 
  end

  def down
   rename_column :members, :password_digest, :password
  end
end
