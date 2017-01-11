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

ActiveRecord::Schema.define(version: 20170111170061) do

  create_table "colleges", force: :cascade do |t|
    t.string   "college_name", limit: 255
    t.integer  "kind",         limit: 4,   default: 0
    t.string   "locate",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecture_comments", force: :cascade do |t|
    t.integer  "difficulty", limit: 4
    t.text     "comment",    limit: 65535
    t.integer  "lecture_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "lecture_comments", ["lecture_id"], name: "fk_rails_4750479e6b", using: :btree
  add_index "lecture_comments", ["user_id"], name: "index_lecture_comments_on_user_id", using: :btree

  create_table "lectures", force: :cascade do |t|
    t.string   "lecture_title", limit: 255
    t.string   "teacher",       limit: 255
    t.text     "content",       limit: 65535
    t.integer  "college_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       limit: 4
  end

  add_index "lectures", ["college_id"], name: "fk_rails_6f14f944aa", using: :btree
  add_index "lectures", ["user_id"], name: "index_lectures_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["product_id"], name: "fk_rails_f7ed05ee50", using: :btree
  add_index "likes", ["user_id"], name: "fk_rails_1e09b5dabf", using: :btree

  create_table "product_comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "product_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "product_comments", ["product_id"], name: "fk_rails_60c61a6e24", using: :btree
  add_index "product_comments", ["user_id"], name: "index_product_comments_on_user_id", using: :btree

  create_table "product_images", force: :cascade do |t|
    t.text     "image",      limit: 65535
    t.integer  "product_id", limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "concept",     limit: 65535
    t.string   "year",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "college_id",  limit: 4
    t.integer  "lecture_id",  limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "likes_count", limit: 4
  end

  add_index "products", ["college_id"], name: "index_products_on_college_id", using: :btree
  add_index "products", ["lecture_id"], name: "index_products_on_lecture_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name",                   limit: 255
    t.text     "profile",                limit: 65535
    t.text     "avatar",                 limit: 65535
    t.string   "college_name",           limit: 255
    t.integer  "admin",                  limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "lecture_comments", "lectures"
  add_foreign_key "lectures", "colleges"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "product_comments", "products"
  add_foreign_key "product_images", "products"
end
