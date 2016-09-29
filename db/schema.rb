# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160929130957) do

  create_table "colleges", force: :cascade do |t|
    t.string   "college_name", limit: 255
    t.integer  "type",         limit: 4,   default: 0
    t.string   "locate",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "lecture_title", limit: 255
    t.string   "teacher",       limit: 255
    t.text     "content",       limit: 65535
    t.integer  "college_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures", ["college_id"], name: "fk_rails_6f14f944aa", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.text     "image",      limit: 65535
    t.integer  "product_id", limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "concept",          limit: 65535
    t.string   "catchcopy",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_image_id", limit: 4
    t.integer  "college_id",       limit: 4
    t.integer  "lecture_id",       limit: 4
  end

  add_index "products", ["college_id"], name: "index_products_on_college_id", using: :btree
  add_index "products", ["lecture_id"], name: "index_products_on_lecture_id", using: :btree
  add_index "products", ["product_image_id"], name: "index_products_on_product_image_id", using: :btree

  add_foreign_key "lectures", "colleges"
  add_foreign_key "product_images", "products"
end
