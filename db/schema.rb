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

ActiveRecord::Schema.define(version: 20150308103820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertices", primary_key: "experticeid", force: :cascade do |t|
    t.string  "name",          limit: 40
    t.integer "preferencesid",            null: false
  end

  create_table "preferences", primary_key: "preferencesid", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences_project", id: false, force: :cascade do |t|
    t.integer "projectid",     null: false
    t.integer "preferencesid", null: false
  end

  create_table "profiles", primary_key: "profileid", force: :cascade do |t|
    t.string "profile", limit: 40
  end

  create_table "projects", primary_key: "projectid", force: :cascade do |t|
    t.string   "project_name",        limit: 120
    t.string   "scope",               limit: 400
    t.string   "description",         limit: 200
    t.datetime "created_at",                      precision: 6
    t.datetime "updated_at",                      precision: 6
    t.integer  "userid",                                        null: false
    t.integer  "user_validate_id",                              null: false
    t.integer  "proyect_typesid",                               null: false
    t.datetime "validate_at",                     precision: 6
    t.integer  "validation_statusid",                           null: false
    t.integer  "invalidate_typeid",                             null: false
    t.integer  "statusid"
    t.integer  "proposed_time"
    t.integer  "step_01"
    t.integer  "step_02"
    t.integer  "total_percent"
    t.integer  "goal"
    t.datetime "goal_time",                       precision: 6
  end

  create_table "proyect_types", primary_key: "proyect_typesid", force: :cascade do |t|
    t.string  "proyect_types", limit: 40
    t.integer "statusid"
  end

  create_table "status", primary_key: "statusid", force: :cascade do |t|
    t.integer "type"
    t.string  "name", limit: 30
  end

  create_table "users", primary_key: "userid", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "zip"
    t.integer  "statusid"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_cluster", id: false, force: :cascade do |t|
    t.integer  "preferencesid",               null: false
    t.integer  "userid",                      null: false
    t.integer  "reviewer_id"
    t.datetime "reviewer_at",   precision: 6
    t.integer  "statusid",                    null: false
  end

  create_table "users_expertices", id: false, force: :cascade do |t|
    t.integer "experticeid", null: false
    t.integer "userid",      null: false
  end

  create_table "users_preferences", id: false, force: :cascade do |t|
    t.integer "userid",        null: false
    t.integer "preferencesid", null: false
  end

  create_table "users_profiles", id: false, force: :cascade do |t|
    t.integer "profileid", null: false
    t.integer "userid",    null: false
  end

  create_table "users_projects", id: false, force: :cascade do |t|
    t.integer  "projectid",                null: false
    t.integer  "userid",                   null: false
    t.datetime "created_at", precision: 6
  end

  create_table "users_reviews", primary_key: "users_reviewid", force: :cascade do |t|
    t.string   "message",    limit: 120
    t.integer  "score"
    t.datetime "created_at",             precision: 6
    t.integer  "projectid",                            null: false
    t.integer  "userid",                               null: false
  end

  add_foreign_key "expertices", "preferences", column: "preferencesid", primary_key: "preferencesid", name: "refpreferences271"
  add_foreign_key "preferences_project", "preferences", column: "preferencesid", primary_key: "preferencesid", name: "refpreferences181"
  add_foreign_key "preferences_project", "projects", column: "projectid", primary_key: "projectid", name: "refprojects171"
  add_foreign_key "projects", "status", column: "invalidate_typeid", primary_key: "statusid", name: "refstatus301"
  add_foreign_key "projects", "status", column: "statusid", primary_key: "statusid", name: "refstatus101"
  add_foreign_key "projects", "status", column: "validation_statusid", primary_key: "statusid", name: "refstatus121"
  add_foreign_key "projects", "users", column: "user_validate_id", primary_key: "userid", name: "refusers51"
  add_foreign_key "projects", "users", column: "userid", primary_key: "userid", name: "refusers41"
  add_foreign_key "users_cluster", "preferences", column: "preferencesid", primary_key: "preferencesid", name: "refpreferences231"
  add_foreign_key "users_cluster", "status", column: "statusid", primary_key: "statusid", name: "refstatus281"
  add_foreign_key "users_cluster", "users", column: "userid", primary_key: "userid", name: "refusers241"
  add_foreign_key "users_expertices", "expertices", column: "experticeid", primary_key: "experticeid", name: "refexpertices251"
  add_foreign_key "users_expertices", "users", column: "userid", primary_key: "userid", name: "refusers261"
  add_foreign_key "users_preferences", "preferences", column: "preferencesid", primary_key: "preferencesid", name: "refpreferences221"
  add_foreign_key "users_preferences", "users", column: "userid", primary_key: "userid", name: "refusers201"
  add_foreign_key "users_profiles", "profiles", column: "profileid", primary_key: "profileid", name: "refprofiles151"
  add_foreign_key "users_profiles", "users", column: "userid", primary_key: "userid", name: "refusers161"
  add_foreign_key "users_projects", "projects", column: "projectid", primary_key: "projectid", name: "refprojects21"
  add_foreign_key "users_projects", "users", column: "userid", primary_key: "userid", name: "refusers31"
  add_foreign_key "users_reviews", "projects", column: "projectid", primary_key: "projectid", name: "refprojects71"
  add_foreign_key "users_reviews", "users", column: "userid", primary_key: "userid", name: "refusers81"
end
