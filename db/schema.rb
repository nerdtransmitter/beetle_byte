# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_23_132947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "target_date"
    t.date "actual_end_date"
    t.bigint "created_by_id", null: false
    t.bigint "updated_by_id"
    t.bigint "lead_dev_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manager_id"
    t.index ["created_by_id"], name: "index_projects_on_created_by_id"
    t.index ["lead_dev_id"], name: "index_projects_on_lead_dev_id"
    t.index ["manager_id"], name: "index_projects_on_manager_id"
    t.index ["updated_by_id"], name: "index_projects_on_updated_by_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "status"
    t.integer "priority"
    t.string "summary"
    t.text "details"
    t.bigint "created_by_id", null: false
    t.bigint "modified_by_id"
    t.bigint "dev_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date"
    t.text "resolution_summary"
    t.datetime "completed_on"
    t.index ["created_by_id"], name: "index_tickets_on_created_by_id"
    t.index ["dev_id"], name: "index_tickets_on_dev_id"
    t.index ["modified_by_id"], name: "index_tickets_on_modified_by_id"
    t.index ["project_id"], name: "index_tickets_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projects", "users", column: "created_by_id"
  add_foreign_key "projects", "users", column: "lead_dev_id"
  add_foreign_key "projects", "users", column: "manager_id"
  add_foreign_key "projects", "users", column: "updated_by_id"
  add_foreign_key "tickets", "projects"
  add_foreign_key "tickets", "users", column: "created_by_id"
  add_foreign_key "tickets", "users", column: "dev_id"
  add_foreign_key "tickets", "users", column: "modified_by_id"
end
