# Creates Events table for Event Model
class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :slug, :category, :banner_img, :card_img
      t.string :venue_name, :street, :city, :state, :zipcode
      t.text :desc
      t.float :goal, :raised
      t.datetime :event_start, :event_stop
      t.boolean :has_registrations, default: true
      t.boolean :has_tickets, default: false
      t.boolean :has_teams, default: true
      t.boolean :has_donations, default: true
      t.boolean :has_sponsors, default: true
      t.boolean :has_fundraisers, default: true
      t.boolean :has_shirts, default: true
      t.boolean :has_progress, default: true
      t.boolean :has_resources, default: true
      t.boolean :is_private, default: false
      t.boolean :is_published, default: false
      t.boolean :is_external, default: false
      t.boolean :custom_settings, default: false
      t.boolean :custom_slug, default: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
