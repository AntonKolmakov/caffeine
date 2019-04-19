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

ActiveRecord::Schema.define(version: 2014_11_25_125347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "watermark"
    t.string "slug"
    t.boolean "fix_slug", default: false
    t.text "description"
    t.text "short_description"
    t.index ["slug"], name: "index_albums_on_slug"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.integer "album_id"
    t.integer "position"
  end

  create_table "menu_elements", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "css"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.integer "page_id"
    t.integer "album_id"
    t.string "type"
  end

  create_table "page_attachments", id: :serial, force: :cascade do |t|
    t.string "attachment"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "original_filename"
    t.index ["page_id"], name: "index_page_attachments_on_page_id"
  end

  create_table "page_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "page_desc_idx"
  end

  create_table "page_images", id: :serial, force: :cascade do |t|
    t.string "picture"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_page_images_on_page_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "fix_slug", default: false
    t.integer "status", default: 0
    t.text "description"
    t.text "short_description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "album_id"
    t.integer "position"
    t.boolean "main", default: false
    t.string "random_token"
    t.index ["album_id"], name: "index_pages_on_album_id"
    t.index ["slug"], name: "index_pages_on_slug"
  end

  create_table "seo_data", id: :serial, force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.text "seo_text"
    t.string "datable_type"
    t.integer "datable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["datable_type", "datable_id"], name: "index_seo_data_on_datable_type_and_datable_id"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "user_form_field_values", id: :serial, force: :cascade do |t|
    t.string "value"
    t.integer "user_form_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["user_form_field_id"], name: "index_user_form_field_values_on_user_form_field_id"
  end

  create_table "user_form_fields", id: :serial, force: :cascade do |t|
    t.string "type"
    t.boolean "required"
    t.integer "user_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_in_admin_table", default: false
    t.integer "position"
    t.text "settings"
    t.index ["show_in_admin_table"], name: "index_user_form_fields_on_show_in_admin_table"
    t.index ["user_form_id"], name: "index_user_form_fields_on_user_form_id"
  end

  create_table "user_form_submission_field_values", id: :serial, force: :cascade do |t|
    t.integer "user_form_submission_id"
    t.integer "user_form_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["user_form_field_id"], name: "index_submission_field_values_on_user_form_field_id"
    t.index ["user_form_submission_id"], name: "index_submission_field_values_on_user_form_submission_id"
  end

  create_table "user_form_submissions", id: :serial, force: :cascade do |t|
    t.integer "user_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_form_id"], name: "index_user_form_submissions_on_user_form_id"
  end

  create_table "user_forms", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_id"
    t.string "alias"
    t.index ["page_id"], name: "index_user_forms_on_page_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
