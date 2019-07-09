class CreatePermissionPolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_policies do |t|
      t.string :name
      t.boolean :io1
      t.boolean :io2
      t.boolean :io3
      t.boolean :io4

      t.timestamps
    end
  end
end
