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

ActiveRecord::Schema.define(version: 2018_06_06_194356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discussions", force: :cascade do |t|
    t.string "discussionable_type"
    t.bigint "discussionable_id"
    t.string "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["discussionable_type", "discussionable_id"], name: "index_discussions_on_discussionable_type_and_discussionable_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.string "status"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id"
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "message"
    t.bigint "discussion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["discussion_id"], name: "index_messages_on_discussion_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.integer "rate_cents"
    t.string "status", default: "Pending"
    t.string "first_skill"
    t.string "second_skill"
    t.string "third_skill"
    t.string "skill_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["project_id"], name: "index_positions_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "short_description"
    t.date "deadline"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "status", default: "Started"
    t.string "photo"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id"
    t.integer "rateable_id"
    t.string "rateable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "user_positions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "position_id"
    t.integer "rate_cents", default: 1500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "In review"
    t.index ["position_id"], name: "index_user_positions_on_position_id"
    t.index ["user_id"], name: "index_user_positions_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "address"
    t.string "phone"
    t.integer "rate_cents", default: 1500
    t.string "linkedin_id"
    t.string "github_id"
    t.string "skill_level"
    t.text "linkedin_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "messages", "discussions"
  add_foreign_key "positions", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "user_positions", "positions"
  add_foreign_key "user_positions", "users"
end
