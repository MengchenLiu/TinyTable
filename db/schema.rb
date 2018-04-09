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

ActiveRecord::Schema.define(version: 0) do

  create_table "reservations", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "time"
    t.integer  "size"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string  "name"
    t.text    "address",     default: "\"\""
    t.integer "table_num"
    t.text    "description", default: "\"\""
    t.text    "web_link",    default: "\"\""
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
    t.text    "content"
    t.integer "score"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.integer "point",        default: 0
    t.string  "email"
    t.boolean "is_admin",     default: false
    t.string  "password"
    t.string  "phone_number"
  end

end
