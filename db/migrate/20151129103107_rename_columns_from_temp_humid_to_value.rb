class RenameColumnsFromTempHumidToValue < ActiveRecord::Migration
  def change
    rename_column :temperature_data, :temp, :value
    rename_column :humidity_data, :humid, :value
  end
end
