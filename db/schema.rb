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

ActiveRecord::Schema.define(version: 2021_12_09_125849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "article_category"
    t.string "article_title"
    t.string "image_url"
    t.text "content_desc"
    t.integer "id_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "main_article"
  end

  create_table "bookings", force: :cascade do |t|
    t.text "message"
    t.string "payment_method"
    t.integer "total_price"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.bigint "doctor_schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_bookings_on_doctor_id"
    t.index ["doctor_schedule_id"], name: "index_bookings_on_doctor_schedule_id"
    t.index ["patient_id"], name: "index_bookings_on_patient_id"
  end

  create_table "doctor_schedules", force: :cascade do |t|
    t.bigint "doctor_id"
    t.string "day"
    t.string "date"
    t.string "month"
    t.string "year"
    t.string "time_practice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_schedules_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "doctor_name"
    t.string "speciality"
    t.string "status"
    t.string "star"
    t.string "location_practice"
    t.text "biography"
    t.string "education"
    t.integer "price_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_path"
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_name"
    t.string "status"
    t.string "gender"
    t.string "birth_date"
    t.integer "age"
    t.string "blood_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "password_digest"
    t.integer "age"
    t.string "email"
    t.string "gender"
    t.string "birth_date"
    t.integer "phone_number"
    t.string "image_path"
    t.boolean "is_admin"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
