class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :url
      t.integer :user_id
      t.timestamps :date_register
      t.integer :status
    end
  end
end
