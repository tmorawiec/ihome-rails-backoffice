class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :switch, foreign_key: true
      t.string :value
      t.references :user, foreign_key: true
      t.bigint :timeStamp

      t.timestamps
    end
  end
end
