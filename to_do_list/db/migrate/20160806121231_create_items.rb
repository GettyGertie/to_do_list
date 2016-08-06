class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :activity
      t.integer :condition
      t.integer :status

      t.timestamps
    end
  end
end
