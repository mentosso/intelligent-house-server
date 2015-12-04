class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :action
      t.references :actuator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
