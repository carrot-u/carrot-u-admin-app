# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_23_182731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_questions", force: :cascade do |t|
    t.text "text"
    t.string "role"
    t.boolean "current"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_session_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_session_id"
    t.string "role"
    t.boolean "notification_sent"
    t.datetime "manager_approved_at"
    t.datetime "accepted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_session_id"], name: "index_course_session_users_on_course_session_id"
    t.index ["user_id"], name: "index_course_session_users_on_user_id"
  end

  create_table "course_sessions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "repository_link"
    t.bigint "lectures_id"
    t.index ["lectures_id"], name: "index_course_sessions_on_lectures_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.text "content"
    t.bigint "lecture_id"
    t.text "status"
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_id"], name: "index_homeworks_on_lecture_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "lecture_name"
    t.string "lecture_content"
    t.string "video_link"
    t.bigint "homework_id"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_session_id"
    t.datetime "schedule_date"
    t.index ["course_session_id"], name: "index_lectures_on_course_session_id"
    t.index ["homework_id"], name: "index_lectures_on_homework_id"
    t.index ["teacher_id"], name: "index_lectures_on_teacher_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "manager_name"
    t.string "manager_email"
    t.boolean "is_active"
    t.boolean "is_approved"
    t.text "skills"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
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
    t.string "id_token"
    t.string "token"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_sessions", "lectures", column: "lectures_id"
  add_foreign_key "lectures", "course_sessions"
end
