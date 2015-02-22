# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150222051529) do

  create_table "announcements", force: true do |t|
    t.string   "title"
    t.string   "message"
    t.string   "date"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "images", force: true do |t|
    t.string   "alt",               default: ""
    t.string   "hint",              default: ""
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "authors"
    t.text     "co_authors"
    t.string   "gps_lat"
    t.boolean  "poster"
    t.boolean  "previous_attendance"
    t.string   "attendance_year"
    t.boolean  "previous_bursary"
    t.boolean  "bursary"
    t.text     "reason_for_bursary"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "introduction"
    t.text     "methods"
    t.text     "results"
    t.text     "discussion"
    t.string   "gps_lng"
    t.string   "visual_abstract_file_name"
    t.string   "visual_abstract_content_type"
    t.integer  "visual_abstract_file_size"
    t.datetime "visual_abstract_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality"
    t.string   "middle_name"
    t.string   "gender"
    t.string   "title"
    t.text     "institutional_affiliation"
    t.string   "phone"
    t.text     "address"
    t.string   "pio"
    t.string   "oci"
    t.text     "guardian_names"
    t.date     "date_of_birth",                      limit: 255
    t.string   "place_of_birth"
    t.string   "passport_number"
    t.string   "passport_place"
    t.date     "passport_date_of_issue",             limit: 255
    t.string   "passport_place_of_issue"
    t.date     "passport_date_of_expiry",            limit: 255
    t.text     "address_as_stated_in_your_passport"
    t.text     "indian_consulate"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "ticket_number"
    t.string   "passportscan_file_name"
    t.string   "passportscan_content_type"
    t.integer  "passportscan_file_size"
    t.datetime "passportscan_updated_at"
    t.string   "student"
    t.boolean  "studying"
    t.string   "mothers_name"
    t.string   "consulate_email"
    t.string   "consulate_phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "webpages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "webpages", ["slug"], name: "index_webpages_on_slug", unique: true

end
