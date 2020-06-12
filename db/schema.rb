# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_12_120520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "code"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "college_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "scores", force: :cascade do |t|
    t.string "subject"
    t.integer "score"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_scores_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "registration_number"
    t.string "gender"
    t.string "dob"
    t.integer "year_of_registration"
    t.string "batch"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  add_foreign_key "departments", "colleges"
  add_foreign_key "scores", "students"
  add_foreign_key "students", "departments"
end
