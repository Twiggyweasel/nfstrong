# Creates Sponsors table for Sponsor Model
class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :name, :logo, :category
      t.float :fee, :raised
      t.boolean :paid, default: false
      t.boolean :accepted_terms, default: false
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
