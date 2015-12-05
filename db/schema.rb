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

ActiveRecord::Schema.define(version: 20151204193436) do

  create_table "class_bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exercise_class_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "class_bookings", ["exercise_class_id"], name: "index_class_bookings_on_exercise_class_id"
  add_index "class_bookings", ["user_id"], name: "index_class_bookings_on_user_id"

  create_table "exercise_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "day"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercise_classes", ["user_id", "created_at"], name: "index_exercise_classes_on_user_id_and_created_at"
  add_index "exercise_classes", ["user_id"], name: "index_exercise_classes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "trainer",         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
