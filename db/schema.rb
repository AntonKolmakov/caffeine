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

ActiveRecord::Schema.define(version: 20140822112521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casein_admin_users", force: true do |t|
    t.string   "login",                           null: false
    t.string   "name"
    t.string   "email"
    t.integer  "access_level",        default: 0, null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "category_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "tag_anc_desc_udx", unique: true, using: :btree
  add_index "category_hierarchies", ["descendant_id"], name: "tag_desc_idx", using: :btree

  create_table "posts", force: true do |t|
    t.text     "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_form_field_values", force: true do |t|
    t.string   "value"
    t.integer  "user_form_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_form_field_values", ["user_form_field_id"], name: "index_user_form_field_values_on_user_form_field_id", using: :btree

  create_table "user_form_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "user_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_admin_table", default: false
  end

  add_index "user_form_fields", ["show_in_admin_table"], name: "index_user_form_fields_on_show_in_admin_table", using: :btree
  add_index "user_form_fields", ["user_form_id"], name: "index_user_form_fields_on_user_form_id", using: :btree

  create_table "user_form_submission_field_values", force: true do |t|
    t.integer  "user_form_submission_id"
    t.integer  "user_form_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "value"
  end

  add_index "user_form_submission_field_values", ["user_form_field_id"], name: "index_submission_field_values_on_user_form_field_id", using: :btree
  add_index "user_form_submission_field_values", ["user_form_submission_id"], name: "index_submission_field_values_on_user_form_submission_id", using: :btree

  create_table "user_form_submissions", force: true do |t|
    t.integer  "user_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_form_submissions", ["user_form_id"], name: "index_user_form_submissions_on_user_form_id", using: :btree

  create_table "user_forms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
