# Creates Donations table for Donation Model
class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.string :payee, :category, :honoree
      t.float :amount
      t.text :comment
      t.boolean :paid, default: false
      t.boolean :collected, default: false
      t.references :user, foreign_key: true
      t.integer :backable_id
      t.string :backable_type
    end
  end
end
