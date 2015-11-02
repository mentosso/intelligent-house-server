class CreateTemperatureData < ActiveRecord::Migration
  def change
    create_table :temperature_data do |t|
      t.decimal :temp
      t.references :sensor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
