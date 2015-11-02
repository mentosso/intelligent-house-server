class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :number
      t.boolean :state
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
