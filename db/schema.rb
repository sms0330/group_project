
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_08_05_194314) do
=======
ActiveRecord::Schema.define(version: 2021_08_05_232627) do
>>>>>>> 23d8b1c47d59ce23b609c723bfa79bef76e25b78

  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "description"
    t.integer "seats"
    t.date "start_date"
    t.date "end_date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
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
