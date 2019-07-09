class AddPermissionPolicyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :permission_policy, foreign_key: true
  end
end
