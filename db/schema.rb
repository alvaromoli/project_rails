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

ActiveRecord::Schema.define(version: 2019_08_22_012949) do

  create_table "contacts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ident_type"
    t.string "ident_cod"
    t.string "gender"
    t.date "birth_date"
    t.string "avatar"
    t.string "names"
    t.string "lastnames"
    t.string "civil_status"
    t.string "phone"
    t.string "address"
    t.string "country"
    t.string "city"
    t.index ["email"], name: "index_contacts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_contacts_on_reset_password_token", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "cost_center"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string "cod"
    t.date "from"
    t.date "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postulations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "program_id"
    t.integer "contact_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_postulations_on_contact_id"
    t.index ["program_id"], name: "index_postulations_on_program_id"
    t.index ["user_id"], name: "index_postulations_on_user_id"
  end

  create_table "program_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "program_id"
    t.integer "status"
    t.integer "assign_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_assignments_on_program_id"
    t.index ["user_id"], name: "index_program_assignments_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "program_type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "period_id"
    t.integer "department_id"
    t.index ["department_id"], name: "index_programs_on_department_id"
    t.index ["period_id"], name: "index_programs_on_period_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "postulation_id"
    t.string "body"
    t.date "question_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postulation_id"], name: "index_questions_on_postulation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
