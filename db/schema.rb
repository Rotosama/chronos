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

ActiveRecord::Schema[7.0].define(version: 2023_08_28_134853) do
  create_table "breaks", force: :cascade do |t|
    t.integer "time_entry_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["time_entry_id"], name: "index_breaks_on_time_entry_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.integer "worker_id"
    t.datetime "entry_date"
    t.datetime "exit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_time_entries_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "dni"
    t.integer "department_id"
    t.date "birthdate"
    t.date "start_date"
    t.date "finish_date"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_workers_on_department_id"
  end

  add_foreign_key "breaks", "time_entries"
  add_foreign_key "time_entries", "workers"
  add_foreign_key "workers", "departments"
end
