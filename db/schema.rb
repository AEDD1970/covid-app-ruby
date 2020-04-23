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

ActiveRecord::Schema.define(version: 2020_04_23_021911) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "document_type"
    t.string "blood_type"
    t.string "gender"
    t.string "position"
    t.integer "company_id"
    t.string "campus"
    t.string "email"
    t.string "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_histories", force: :cascade do |t|
    t.datetime "entry_time"
    t.datetime "departure_time"
    t.string "temperature"
    t.boolean "mask"
    t.boolean "new_mask"
    t.boolean "symptom"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
