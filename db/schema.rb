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

ActiveRecord::Schema.define(version: 2021_08_10_070607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "items_a", id: :bigint, default: -> { "nextval('items_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "items_a_user_id_idx"
  end

  create_table "items_b", id: :bigint, default: -> { "nextval('items_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "items_b_user_id_idx"
  end

  create_table "items_template", id: :bigint, default: -> { "nextval('items_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "items_template_user_id_idx"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "items", "users", on_delete: :cascade
  add_foreign_key "items_a", "users", on_delete: :cascade
  add_foreign_key "items_b", "users", on_delete: :cascade
end
