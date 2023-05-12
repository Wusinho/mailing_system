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

ActiveRecord::Schema[7.0].define(version: 2023_05_12_215222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupon_questions", force: :cascade do |t|
    t.bigint "coupon_survey_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_survey_id"], name: "index_coupon_questions_on_coupon_survey_id"
    t.index ["question_id"], name: "index_coupon_questions_on_question_id"
  end

  create_table "coupon_surveys", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_coupon_surveys_on_subscription_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question", null: false
    t.string "alternatives", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email", null: false
    t.string "preferences", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_subscriptions_on_email", unique: true
  end

  add_foreign_key "coupon_questions", "coupon_surveys"
  add_foreign_key "coupon_questions", "questions"
  add_foreign_key "coupon_surveys", "subscriptions"
end
