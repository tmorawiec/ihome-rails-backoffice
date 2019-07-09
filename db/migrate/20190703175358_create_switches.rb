class CreateSwitches < ActiveRecord::Migration[5.2]
  def change
    create_table :switches do |t|
      t.string :name
      t.integer :pin
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
