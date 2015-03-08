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

ActiveRecord::Schema.define(version: 20150308123157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expert_reviews", force: :cascade do |t|
    t.string   "message",    limit: 120
    t.integer  "score"
    t.datetime "created_at"
    t.integer  "project_id",             null: false
    t.integer  "user_id",                null: false
    t.integer  "status_id"
  end

  create_table "expert_users", id: false, force: :cascade do |t|
    t.integer  "preference_id", null: false
    t.integer  "user_id",       null: false
    t.integer  "reviewer_id"
    t.datetime "reviewer_at"
    t.integer  "status_id",     null: false
  end

  create_table "expertices", force: :cascade do |t|
    t.string  "name",          limit: 40
    t.integer "preference_id",            null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name", limit: 30
  end

  create_table "preferences", force: :cascade do |t|
    t.string   "name",       limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences_projects", id: false, force: :cascade do |t|
    t.integer "project_id",    null: false
    t.integer "preference_id", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profile", limit: 30
  end

  create_table "project_types", force: :cascade do |t|
    t.string  "type",      limit: 40
    t.integer "status_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                 limit: 120
    t.string   "scope",                limit: 400
    t.string   "description",          limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                          null: false
    t.integer  "user_validate_id",                 null: false
    t.integer  "project_types_id",                 null: false
    t.datetime "validate_at"
    t.integer  "validation_status_id",             null: false
    t.integer  "invalidate_type_id",               null: false
    t.integer  "status_id"
    t.integer  "proposed_time"
    t.integer  "step_01"
    t.integer  "step_02"
    t.integer  "step_03"
    t.integer  "total_percent"
    t.integer  "goal"
    t.datetime "goal_time"
  end

  create_table "status", force: :cascade do |t|
    t.string  "name", limit: 30
    t.integer "type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 30
    t.string   "last_name",              limit: 40
    t.string   "address",                limit: 400
    t.string   "sex",                    limit: 30
    t.string   "facebook",               limit: 40
    t.string   "twitter",                limit: 40
    t.string   "zip",                    limit: 10
    t.datetime "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id",                                       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_expertices", id: false, force: :cascade do |t|
    t.integer "expertice_id", null: false
    t.integer "user_id",      null: false
  end

  create_table "users_preferences", id: false, force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "preference_id", null: false
  end

  create_table "users_profiles", id: false, force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "users_projects", id: false, force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
  end

  add_foreign_key "expert_reviews", "projects", name: "expert_reviews_project_id_fkey"
  add_foreign_key "expert_reviews", "status", name: "expert_reviews_status_id_fkey"
  add_foreign_key "expert_reviews", "users", name: "expert_reviews_user_id_fkey"
  add_foreign_key "expert_users", "preferences", name: "expert_users_preference_id_fkey"
  add_foreign_key "expert_users", "status", name: "expert_users_status_id_fkey"
  add_foreign_key "expert_users", "users", name: "expert_users_user_id_fkey"
  add_foreign_key "expertices", "preferences", name: "expertices_preference_id_fkey"
  add_foreign_key "preferences_projects", "preferences", name: "preferences_projects_preference_id_fkey"
  add_foreign_key "preferences_projects", "projects", name: "preferences_projects_project_id_fkey"
  add_foreign_key "project_types", "status", name: "project_types_status_id_fkey"
  add_foreign_key "projects", "project_types", column: "project_types_id", name: "projects_project_types_id_fkey"
  add_foreign_key "projects", "status", column: "invalidate_type_id", name: "projects_invalidate_type_id_fkey"
  add_foreign_key "projects", "status", column: "validation_status_id", name: "projects_validation_status_id_fkey"
  add_foreign_key "projects", "status", name: "projects_status_id_fkey"
  add_foreign_key "projects", "users", column: "user_validate_id", name: "projects_user_validate_id_fkey"
  add_foreign_key "projects", "users", name: "projects_user_id_fkey"
  add_foreign_key "users", "status", name: "users_status_id_fkey"
  add_foreign_key "users_expertices", "expertices", name: "users_expertices_expertice_id_fkey"
  add_foreign_key "users_expertices", "users", name: "users_expertices_user_id_fkey"
  add_foreign_key "users_preferences", "preferences", name: "users_preferences_preference_id_fkey"
  add_foreign_key "users_preferences", "users", name: "users_preferences_user_id_fkey"
  add_foreign_key "users_profiles", "profiles", name: "users_profiles_profile_id_fkey"
  add_foreign_key "users_profiles", "users", name: "users_profiles_user_id_fkey"
  add_foreign_key "users_projects", "projects", name: "users_projects_project_id_fkey"
  add_foreign_key "users_projects", "users", name: "users_projects_user_id_fkey"
end
