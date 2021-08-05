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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_08_04_223659) do
=======
ActiveRecord::Schema.define(version: 2021_08_05_010118) do
>>>>>>> 192b75719404047e9f5fce7ca5471176b2307a7a

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "passphrase"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

=======
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.integer "seats"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.index ["student_id"], name: "index_courses_on_student_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.boolean "book"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "teacher_id", null: false
    t.index ["teacher_id"], name: "index_facilities_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["email"], name: "index_students_on_email"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_id", null: false
    t.bigint "student_id", null: false
    t.bigint "facility_id", null: false
    t.index ["course_id"], name: "index_teachers_on_course_id"
    t.index ["email"], name: "index_teachers_on_email"
    t.index ["facility_id"], name: "index_teachers_on_facility_id"
    t.index ["student_id"], name: "index_teachers_on_student_id"
  end

  add_foreign_key "courses", "students"
  add_foreign_key "courses", "teachers"
  add_foreign_key "facilities", "teachers"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "teachers"
  add_foreign_key "teachers", "courses"
  add_foreign_key "teachers", "facilities"
  add_foreign_key "teachers", "students"
>>>>>>> 192b75719404047e9f5fce7ca5471176b2307a7a
end
