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

ActiveRecord::Schema.define(version: 2021_06_22_220756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "teaser"
    t.text "body"
    t.string "category", default: "General"
    t.string "linked_module"
    t.boolean "published", default: false
    t.datetime "published_on"
    t.bigint "user_id"
    t.bigint "image_id"
    t.bigint "pdf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "cta_read_more", default: "Read More"
    t.string "cta_pdf", default: "Get My Free PDF"
    t.string "cta_video", default: "Watch the Video"
    t.string "convertkit_data_form_toggle"
    t.string "convertkit_href"
    t.bigint "pin_image_id"
    t.string "data_pin_description"
    t.string "freebie_filename"
    t.string "video_link"
    t.string "freebie_type", default: "None"
    t.string "freebie_description"
    t.integer "comments_count"
    t.bigint "subcategory_id"
    t.boolean "affiliate_links", default: true
    t.boolean "approved", default: false
    t.boolean "submitted", default: false
    t.string "photo_url"
    t.boolean "photo_external", default: false
    t.boolean "featured_home", default: false
    t.boolean "featured_category", default: false
    t.bigint "resource_id"
    t.boolean "house", default: false
    t.boolean "marriage", default: false
    t.boolean "pregnancy", default: false
    t.boolean "babies", default: false
    t.boolean "toddlers", default: false
    t.boolean "kids", default: false
    t.boolean "teens", default: false
    t.boolean "balance", default: false
    t.bigint "variation_id"
    t.bigint "freebie_id"
    t.boolean "pillar", default: false
    t.boolean "nondisplayed", default: false
    t.index ["freebie_id"], name: "index_blogs_on_freebie_id"
    t.index ["image_id"], name: "index_blogs_on_image_id"
    t.index ["pdf_id"], name: "index_blogs_on_pdf_id"
    t.index ["pin_image_id"], name: "index_blogs_on_pin_image_id"
    t.index ["resource_id"], name: "index_blogs_on_resource_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
    t.index ["subcategory_id"], name: "index_blogs_on_subcategory_id"
    t.index ["user_id"], name: "index_blogs_on_user_id"
    t.index ["variation_id"], name: "index_blogs_on_variation_id"
  end

  create_table "capsule_items", force: :cascade do |t|
    t.date "item_date"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "title"
    t.text "caption"
    t.bigint "user_id"
    t.bigint "capsule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["capsule_id"], name: "index_capsule_items_on_capsule_id"
    t.index ["user_id"], name: "index_capsule_items_on_user_id"
  end

  create_table "capsules", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.date "capsule_date"
    t.boolean "active", default: true
    t.boolean "reminder_email", default: true
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_orientation", default: "Square"
    t.string "interval", default: "Yearly"
    t.index ["user_id"], name: "index_capsules_on_user_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "category"
    t.text "idea"
    t.boolean "prev_published", default: false
    t.boolean "terms", default: false
    t.text "comments"
    t.boolean "responded", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "blog"
  end

  create_table "freebies", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.string "convertkit_url"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "top_question"
    t.string "main_heading"
    t.text "main_subheading"
    t.string "t1_short"
    t.string "t1_name"
    t.string "t1_title"
    t.string "t1_long"
    t.string "wyg1"
    t.string "wyg2"
    t.string "wyg3"
    t.string "outcome"
    t.string "category"
    t.string "outcome_2"
    t.string "slug"
    t.string "ml_id"
    t.string "ml_submit_code"
    t.string "after_download_url"
    t.string "ml_img_track_url"
    t.index ["slug"], name: "index_freebies_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.string "store"
    t.text "notes"
    t.boolean "purchased", default: false
    t.bigint "user_id"
    t.bigint "person_id", null: false
    t.bigint "occasion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occasion_id"], name: "index_gifts_on_occasion_id"
    t.index ["person_id"], name: "index_gifts_on_person_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "groupings", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "title"
    t.integer "ready_in_minutes"
    t.boolean "gluten_free", default: false
    t.boolean "dairy_free", default: false
    t.boolean "vegetarian", default: false
    t.boolean "vegan", default: false
    t.text "ingredients", default: [], array: true
    t.text "instructions", default: [], array: true
    t.boolean "downloaded", default: false
    t.boolean "favorite", default: false
    t.bigint "user_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "user_id"
    t.string "name"
    t.date "date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_occasions_on_person_id"
    t.index ["user_id"], name: "index_occasions_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "relationship"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "birthday"
    t.date "anniversary"
    t.date "other"
    t.string "other_date_name"
    t.text "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "preauthorizations", force: :cascade do |t|
    t.string "email"
    t.boolean "admin", default: false
    t.boolean "contributor", default: false
    t.boolean "fulfilled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "printables", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.text "description"
    t.text "link"
    t.boolean "house", default: false
    t.boolean "marriage", default: false
    t.boolean "pregnancy", default: false
    t.boolean "babies", default: false
    t.boolean "toddlers", default: false
    t.boolean "kids", default: false
    t.boolean "teens", default: false
    t.boolean "balance", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "comment_id"
    t.boolean "read"
    t.boolean "approved"
    t.boolean "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_responses_on_comment_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "sortings", force: :cascade do |t|
    t.integer "house"
    t.integer "marriage"
    t.integer "pregnancy", default: 0
    t.integer "babies", default: 0
    t.integer "toddlers", default: 0
    t.integer "kids", default: 0
    t.integer "teens", default: 0
    t.integer "balance"
    t.string "ip"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sortings_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.text "description"
    t.boolean "active", default: true
  end

  create_table "subcategorizations", force: :cascade do |t|
    t.bigint "subcategory_id"
    t.bigint "blog_id"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_subcategorizations_on_blog_id"
    t.index ["subcategory_id"], name: "index_subcategorizations_on_subcategory_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "frequency"
    t.boolean "completed", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.boolean "subscribed", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "avatar_id"
    t.text "bio"
    t.string "tagline"
    t.string "website_name"
    t.string "website_url"
    t.string "sm_facebook"
    t.string "sm_pinterest"
    t.string "sm_instagram"
    t.string "sm_twitter"
    t.string "sm_other"
    t.string "sm_youtube"
    t.string "sm_email"
    t.boolean "contributor", default: false
    t.boolean "contributor_request", default: false
    t.boolean "sm_approved", default: false
    t.boolean "sm_needs_approval", default: true
    t.string "spree_api_key", limit: 48
    t.integer "ship_address_id"
    t.integer "bill_address_id"
    t.string "source"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "freebies"
  add_foreign_key "blogs", "users"
  add_foreign_key "capsule_items", "capsules"
  add_foreign_key "capsule_items", "users"
  add_foreign_key "capsules", "users"
  add_foreign_key "gifts", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "occasions", "people"
  add_foreign_key "occasions", "users"
  add_foreign_key "people", "users"
  add_foreign_key "responses", "users"
  add_foreign_key "sortings", "users"
  add_foreign_key "tasks", "users"
end
