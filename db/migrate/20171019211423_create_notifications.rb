# Creates notifications table
class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.boolean :read, default: false
      t.references :user, foreign_key: true
      t.integer :notifiable_id
      t.string :notifiable_type
      t.timestamps
    end
  end
end
