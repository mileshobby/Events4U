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

ActiveRecord::Schema.define(version: 20170521192044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "event_id"], name: "index_bookmarks_on_user_id_and_event_id", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "event_categories", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "event_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id", "category_id"], name: "index_event_categories_on_event_id_and_category_id", unique: true, using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                                                                                                                  null: false
    t.text     "full_description",                                                                                                       null: false
    t.string   "image_url",        default: "http://res.cloudinary.com/events4u/image/upload/v1495234870/crowd-at-concert-2_s7x3bk.jpg", null: false
    t.date     "date",                                                                                                                   null: false
    t.integer  "host_id",                                                                                                                null: false
    t.integer  "total_quantity"
    t.integer  "quantity_left"
    t.float    "price",            default: 0.0,                                                                                         null: false
    t.datetime "created_at",                                                                                                             null: false
    t.datetime "updated_at",                                                                                                             null: false
    t.string   "venue"
    t.string   "street_address"
    t.string   "city_state_zip"
    t.index ["date"], name: "index_events_on_date", using: :btree
    t.index ["host_id"], name: "index_events_on_host_id", using: :btree
    t.index ["price"], name: "index_events_on_price", using: :btree
    t.index ["title"], name: "index_events_on_title", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "event_id"], name: "index_tickets_on_user_id_and_event_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
