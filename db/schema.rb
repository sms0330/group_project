# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_06_070935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.integer "seats"
    t.date "start_date"
    t.date "end_date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "course_code"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.boolean "book"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "description"
    t.index ["user_id"], name: "index_facilities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "is_teacher"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "courses", "users"
  add_foreign_key "facilities", "users"
end
