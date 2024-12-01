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

ActiveRecord::Schema[7.1].define(version: 2024_12_01_145600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bakeries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.string "website"
    t.boolean "contacted"
    t.boolean "tried"
    t.boolean "chosen"
    t.string "contact_name"
    t.text "price_options"
    t.string "photo_url"
    t.text "notes"
    t.string "pdf"
    t.float "deposit"
    t.float "final_price"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caterers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.string "website"
    t.string "photo_url"
    t.string "pdf"
    t.boolean "contacted"
    t.boolean "tried"
    t.boolean "chosen"
    t.string "contact_name"
    t.text "price_options"
    t.integer "cuisine_id"
    t.boolean "preferred"
    t.text "notes"
    t.float "deposit"
    t.float "final_price"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "photo_url"
    t.string "pdf"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.text "notes"
    t.float "deposit"
    t.float "final_price"
    t.string "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.integer "caterers_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "djs", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "photo_url"
    t.string "pdf"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.text "notes"
    t.float "deposit"
    t.float "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "chronological_order"
    t.integer "bakery_id"
    t.integer "coordinator_id"
    t.integer "dj_id"
    t.integer "florist_id"
    t.integer "hotel_id"
    t.integer "lighting_production_company_id"
    t.integer "photographer_id"
    t.integer "transportation_company_id"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "florists", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.text "notes"
    t.float "deposit"
    t.string "contact_name"
    t.float "final_price"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.boolean "contacted"
    t.boolean "chosen"
    t.boolean "block_discount"
    t.integer "minimum_rooms"
    t.integer "neighborhood_id"
    t.text "price_options"
    t.text "notes"
    t.string "contact_name"
    t.float "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lighting_production_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.text "notes"
    t.text "deposit"
    t.string "contact_name"
    t.float "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "caterer_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photographers", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "photo_url"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.float "deposit"
    t.text "notes"
    t.float "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "invite_id"
    t.integer "event_id"
    t.integer "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transportation_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.boolean "contacted"
    t.boolean "chosen"
    t.text "price_options"
    t.boolean "deposit"
    t.text "notes"
    t.string "contact_name"
    t.float "final_price"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "long_list"
    t.boolean "invitee"
    t.boolean "attendee"
    t.integer "tier"
    t.string "group_general"
    t.string "group_specific"
    t.string "notes"
    t.string "role"
    t.integer "invites_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.string "contact_name"
    t.integer "neighborhood_id"
    t.string "capacity"
    t.string "venue_type"
    t.text "price_options"
    t.string "website"
    t.string "photo_url"
    t.string "pdf"
    t.boolean "contacted"
    t.boolean "visited"
    t.boolean "chosen"
    t.float "final_price"
    t.integer "events_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
