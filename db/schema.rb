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

ActiveRecord::Schema.define(version: 20190929203220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.integer "new_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "new_id"
    t.string "image"
  end

  create_table "carcasses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seo_name"
  end

  create_table "cities", force: :cascade do |t|
    t.string "country"
    t.string "name"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commentaries", force: :cascade do |t|
    t.string "email"
    t.text "text"
    t.integer "new_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "name"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "reply"
    t.string "ready_date"
  end

  create_table "fuels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "text"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "manufacturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ready_date"
    t.string "meta_keywords"
    t.text "meta_description"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "city"
    t.string "email"
    t.text "additional"
    t.integer "part_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "title"
    t.text "image"
    t.integer "manufacturer_id"
    t.integer "model_id"
    t.text "year"
    t.integer "volume_id"
    t.string "mark"
    t.string "constr_num"
    t.integer "carcass_id"
    t.integer "color_id"
    t.text "description"
    t.integer "fuel_id"
    t.text "options"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.text "tags"
    t.string "privod"
    t.text "meta_keywords"
    t.text "meta_description"
  end

  create_table "queries", force: :cascade do |t|
    t.integer "manufacturer_id"
    t.string "model"
    t.integer "year"
    t.integer "carcass_id"
    t.integer "fuel_id"
    t.string "volume"
    t.string "power"
    t.string "engine"
    t.string "changer"
    t.string "privod"
    t.string "kpp"
    t.string "part"
    t.text "description"
    t.string "name"
    t.string "city"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "query_images", force: :cascade do |t|
    t.integer "query_id"
    t.string "image"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seos", force: :cascade do |t|
    t.string "action"
    t.string "title"
    t.string "keywords"
    t.text "description"
  end

  create_table "subcategories", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
  end

  create_table "texts", force: :cascade do |t|
    t.string "action"
    t.integer "counter"
    t.text "content"
  end

  create_table "users", force: :cascade do |t|
    t.integer "country_id"
    t.string "phone"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.string "name"
    t.string "email"
  end

  create_table "volumes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
