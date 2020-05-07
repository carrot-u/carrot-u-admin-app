class Okta < ActiveRecord::Migration[6.0]
  def change
    create_table "authorizations", force: :cascade do |t|
      t.string "provider"
      t.string "uid"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end
end
