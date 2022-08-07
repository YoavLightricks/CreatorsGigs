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

ActiveRecord::Schema.define(version: 2022_08_07_073408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authenticated_users", force: :cascade do |t|
    t.string "user_id"
    t.string "apikey"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "errors", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gig_payments", force: :cascade do |t|
    t.string "state", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "gig_id"
    t.index ["gig_id"], name: "index_gig_payments_on_gig_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "brand_name"
    t.string "state", default: "applied"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_gigs_on_creator_id"
  end

  add_foreign_key "gig_payments", "gigs"
  add_foreign_key "gigs", "creators"
end
