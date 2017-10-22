# Creates Registrations table for Registration Model
class CreateRegistration < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.float :fee
      t.float :raised
      t.string :shirt_size
      t.boolean :paid, default: false
      t.boolean :active, default: true
      t.boolean :accepted_terms, default: false
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
