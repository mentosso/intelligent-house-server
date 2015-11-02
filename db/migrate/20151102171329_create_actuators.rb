class CreateActuators < ActiveRecord::Migration
  def change
    create_table :actuators do |t|
      t.string :number
      t.boolean :state
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
