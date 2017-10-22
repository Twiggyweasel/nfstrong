# Creates Activities table for Activity Model
class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :desc
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
