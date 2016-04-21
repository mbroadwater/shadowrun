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

ActiveRecord::Schema.define(version: 20160421025739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_skills", force: :cascade do |t|
    t.integer  "base_skill_id"
    t.integer  "value_base"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "character_id"
  end

  add_index "active_skills", ["base_skill_id"], name: "index_active_skills_on_base_skill_id", using: :btree
  add_index "active_skills", ["character_id"], name: "index_active_skills_on_character_id", using: :btree

  create_table "base_attributes", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "base_skills", force: :cascade do |t|
    t.string   "name"
    t.string   "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_attributes", force: :cascade do |t|
    t.integer  "value_base"
    t.integer  "value_modified"
    t.integer  "max_natural"
    t.integer  "max_augmented"
    t.string   "category"
    t.integer  "character_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "base_attribute_id"
  end

  add_index "char_attributes", ["base_attribute_id"], name: "index_char_attributes_on_base_attribute_id", using: :btree
  add_index "char_attributes", ["character_id"], name: "index_char_attributes_on_character_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  add_index "characters", ["user_id", "created_at"], name: "index_characters_on_user_id_and_created_at", using: :btree
  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "defenses", force: :cascade do |t|
    t.string   "def_type"
    t.integer  "value_normal"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "defenses", ["character_id"], name: "index_defenses_on_character_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
  end

  add_foreign_key "active_skills", "base_skills"
  add_foreign_key "active_skills", "characters"
  add_foreign_key "char_attributes", "base_attributes"
  add_foreign_key "char_attributes", "characters"
  add_foreign_key "characters", "users"
  add_foreign_key "defenses", "characters"
end
