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

ActiveRecord::Schema.define(version: 2018_08_27_143427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agences", force: :cascade do |t|
    t.string "enseigne_name"
    t.string "social_denomination"
    t.string "juridic_form"
    t.string "email"
    t.string "phone_number"
    t.string "fax"
    t.string "address"
    t.string "city"
    t.string "director_first_name"
    t.string "director_last_name"
    t.integer "director_card_number"
    t.date "director_card_date"
    t.string "director_card_city"
    t.string "vat_number"
    t.string "siren_number"
    t.string "insurance_number"
    t.string "social_capital"
    t.string "professional_card_mention"
    t.string "civil_respons_insurance_name"
    t.string "civil_respons_insurance_address"
    t.string "civil_respons_police_number"
    t.string "civil_respons_police_geo_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
