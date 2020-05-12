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

ActiveRecord::Schema.define(version: 2020_05_07_054948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "responsible"
    t.string "responsible_position"
    t.integer "document_number"
    t.string "name"
    t.string "organizational_unit"
    t.string "position"
    t.string "contractor_company"
    t.string "gender_id"
    t.string "eps"
    t.integer "age"
    t.string "blood_type"
    t.bigint "phone"
    t.bigint "emergency_number"
    t.integer "weight"
    t.float "size"
    t.float "imc"
    t.string "interpretation_id"
    t.string "date_and_time"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrance_surveys", force: :cascade do |t|
    t.string "recorded_temperature"
    t.string "new_temperature_recorded"
    t.boolean "sore_throat"
    t.boolean "nasal_congestion"
    t.boolean "cough"
    t.boolean "difficulty_breathing"
    t.boolean "fatigue"
    t.boolean "shaking_chills"
    t.boolean "muscle_pain"
    t.boolean "other_respiratory_symptom"
    t.string "which_respiratory_symptom"
    t.boolean "disposable_face_mask"
    t.boolean "respirator"
    t.boolean "latex_gloves"
    t.boolean "nitrile_gloves"
    t.boolean "rubber_gloves"
    t.boolean "another_item"
    t.string "which_other_element"
    t.boolean "does_not_apply_protection"
    t.string "does_not_apply_because"
    t.boolean "hand_disinfection"
    t.boolean "discard_used_items"
    t.boolean "disinfection_element"
    t.integer "employee_id"
    t.date "date"
    t.string "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exit_surveys", force: :cascade do |t|
    t.string "recorded_temperature_exit"
    t.string "new_temperature_recorded_exit"
    t.boolean "sore_throat_exit"
    t.boolean "nasal_congestion_exit"
    t.boolean "cough_exit"
    t.boolean "difficulty_breathing_exit"
    t.boolean "fatigue_exit"
    t.boolean "shaking_chills_exit"
    t.boolean "muscle_pain_exit"
    t.boolean "other_respiratory_symptom_exit"
    t.string "which_respiratory_symptom_exit"
    t.boolean "disposable_face_mask_exit"
    t.boolean "respirator_exit"
    t.boolean "latex_gloves_exit"
    t.boolean "nitrile_gloves_exit"
    t.boolean "rubber_gloves_exit"
    t.boolean "another_item_exit"
    t.string "which_other_element_exit"
    t.boolean "does_not_apply_protection_exit"
    t.string "does_not_apply_because_exit"
    t.boolean "hand_disinfection_exit"
    t.boolean "discard_used_items_exit"
    t.boolean "disinfection_element_exit"
    t.integer "employee_id"
    t.date "date"
    t.string "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interpretations", force: :cascade do |t|
    t.string "description"
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
    t.integer "company_id"
    t.integer "employee_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
