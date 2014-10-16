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

ActiveRecord::Schema.define(version: 20141014123941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "watermark"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.integer  "album_id"
    t.integer  "position"
  end

  create_table "page_attachments", force: true do |t|
    t.string   "attachment"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "original_filename"
  end

  add_index "page_attachments", ["page_id"], name: "index_page_attachments_on_page_id", using: :btree

  create_table "page_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "page_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_udx", unique: true, using: :btree
  add_index "page_hierarchies", ["descendant_id"], name: "page_desc_idx", using: :btree

  create_table "page_images", force: true do |t|
    t.string   "picture"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.boolean  "fix_slug",          default: false
    t.integer  "status",            default: 0
    t.text     "description"
    t.text     "short_description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
    t.integer  "position"
  end

  add_index "pages", ["album_id"], name: "index_pages_on_album_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "seo_data", force: true do |t|
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.text     "seo_text"
    t.integer  "datable_id"
    t.string   "datable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_data", ["datable_id", "datable_type"], name: "index_seo_data_on_datable_id_and_datable_type", using: :btree

  create_table "user_form_field_values", force: true do |t|
    t.string   "value"
    t.integer  "user_form_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "user_form_field_values", ["user_form_field_id"], name: "index_user_form_field_values_on_user_form_field_id", using: :btree

  create_table "user_form_fields", force: true do |t|
    t.string   "type"
    t.boolean  "required"
    t.integer  "user_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_admin_table", default: false
    t.integer  "position"
    t.text     "settings"
  end

  add_index "user_form_fields", ["show_in_admin_table"], name: "index_user_form_fields_on_show_in_admin_table", using: :btree
  add_index "user_form_fields", ["user_form_id"], name: "index_user_form_fields_on_user_form_id", using: :btree

  create_table "user_form_submission_field_values", force: true do |t|
    t.integer  "user_form_submission_id"
    t.integer  "user_form_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
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
    t.integer  "page_id"
    t.string   "alias"
  end

  add_index "user_forms", ["page_id"], name: "index_user_forms_on_page_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
