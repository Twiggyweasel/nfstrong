# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171021190738) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "donations", force: :cascade do |t|
    t.string "payee"
    t.string "category"
    t.string "honoree"
    t.float "amount"
    t.text "comment"
    t.boolean "paid", default: false
    t.boolean "collected", default: false
    t.integer "user_id"
    t.integer "backable_id"
    t.string "backable_type"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "slug"
    t.string "category"
    t.string "banner_img"
    t.string "card_img"
    t.string "venue_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.text "desc"
    t.float "goal"
    t.float "raised"
    t.datetime "event_start"
    t.datetime "event_stop"
    t.boolean "has_registrations", default: true
    t.boolean "has_tickets", default: false
    t.boolean "has_teams", default: true
    t.boolean "has_donations", default: true
    t.boolean "has_sponsors", default: true
    t.boolean "has_fundraisers", default: true
    t.boolean "has_shirts", default: true
    t.boolean "has_progress", default: true
    t.boolean "has_resources", default: true
    t.boolean "is_private", default: false
    t.boolean "is_published", default: false
    t.boolean "is_external", default: false
    t.boolean "custom_settings", default: false
    t.boolean "custom_slug", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fundraisers", force: :cascade do |t|
    t.string "shirt_size"
    t.float "to_raise"
    t.float "raised"
    t.boolean "goal_met", default: false
    t.boolean "accepted_terms", default: false
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_fundraisers_on_event_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.boolean "read", default: false
    t.integer "user_id"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.float "fee"
    t.float "raised"
    t.string "shirt_size"
    t.boolean "paid", default: false
    t.boolean "active", default: true
    t.boolean "accepted_terms", default: false
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_resources_on_event_id"
  end

  create_table "runners", force: :cascade do |t|
    t.string "event"
    t.string "event_url"
    t.string "city"
    t.string "state"
    t.date "date"
    t.integer "goal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_runners_on_user_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "category"
    t.float "fee"
    t.float "raised"
    t.boolean "paid", default: false
    t.boolean "accepted_terms", default: false
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sponsors_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "profile_pic"
    t.boolean "has_nf", default: false
    t.boolean "child_w_nf"
    t.integer "child_age", default: 0
    t.boolean "email_communications", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
