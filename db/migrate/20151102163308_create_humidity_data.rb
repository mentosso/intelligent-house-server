class CreateHumidityData < ActiveRecord::Migration
  def change
    create_table :humidity_data do |t|
      t.decimal :humid
      t.references :sensor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
