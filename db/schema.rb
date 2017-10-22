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

ActiveRecord::Schema.define(version: 20171022155810) do

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

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone_number"
    t.boolean "has_nf", default: false
    t.boolean "family_member_has_nf", default: false
    t.boolean "family_member_is_child", default: false
    t.boolean "app_notices", default: false
    t.boolean "informed_notices", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
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
