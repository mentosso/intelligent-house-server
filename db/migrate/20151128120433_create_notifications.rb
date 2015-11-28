class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :message_type

      t.timestamps null: false
    end
  end
end
