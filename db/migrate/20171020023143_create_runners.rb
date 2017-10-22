# Creates runners table
class CreateRunners < ActiveRecord::Migration[5.1]
  def change
    create_table :runners do |t|
      t.string :event, :event_url, :city, :state
      t.date :date
      t.integer :goal
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
