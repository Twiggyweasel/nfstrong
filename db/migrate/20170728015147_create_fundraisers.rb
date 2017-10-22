# Creates Fundraisers table for Fundraiser Model
class CreateFundraisers < ActiveRecord::Migration[5.1]
  def change
    create_table :fundraisers do |t|
      t.string :shirt_size
      t.float :to_raise
      t.float :raised
      t.boolean :goal_met, default: false
      t.boolean :accepted_terms, default: false
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
