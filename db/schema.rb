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

ActiveRecord::Schema.define(version: 20160508014227) do

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

  create_table "availabilities", force: :cascade do |t|
    t.string   "type"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "base_attributes", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "base_skill_specialties", force: :cascade do |t|
    t.string   "name"
    t.integer  "base_skill_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "base_skill_specialties", ["base_skill_id"], name: "index_base_skill_specialties_on_base_skill_id", using: :btree

  create_table "base_skills", force: :cascade do |t|
    t.string   "name"
    t.string   "group"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "base_attribute_id"
    t.string   "description"
    t.boolean  "default"
    t.integer  "skill_group_id"
  end

  add_index "base_skills", ["base_attribute_id"], name: "index_base_skills_on_base_attribute_id", using: :btree
  add_index "base_skills", ["skill_group_id"], name: "index_base_skills_on_skill_group_id", using: :btree

  create_table "char_attributes", force: :cascade do |t|
    t.decimal  "value_base"
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

  create_table "character_details", force: :cascade do |t|
    t.integer  "character_id"
    t.string   "real_name"
    t.string   "concept"
    t.string   "description"
    t.string   "background"
    t.string   "metatype"
    t.string   "gender"
    t.string   "hair"
    t.string   "eyes"
    t.string   "ethnicity"
    t.string   "skin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "character_details", ["character_id"], name: "index_character_details_on_character_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "reputations", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "street_cred"
    t.integer  "notoriety"
    t.integer  "public_awareness"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "reputations", ["character_id"], name: "index_reputations_on_character_id", using: :btree

  create_table "skill_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skill_specialties", force: :cascade do |t|
    t.integer  "base_skill_specialty_id"
    t.integer  "character_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "skill_specialties", ["base_skill_specialty_id"], name: "index_skill_specialties_on_base_skill_specialty_id", using: :btree
  add_index "skill_specialties", ["character_id"], name: "index_skill_specialties_on_character_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "slack_id"
  end

  create_table "weapon_modifications", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.integer  "base_skill_id"
    t.integer  "base_skill_specialty_id"
    t.integer  "accuracy"
    t.string   "description"
    t.string   "avail_val"
    t.integer  "availability_id"
    t.integer  "armor_piercing"
    t.integer  "damage_value"
    t.string   "damage_type"
    t.string   "range"
    t.integer  "weapon_modification_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "weapons", ["availability_id"], name: "index_weapons_on_availability_id", using: :btree
  add_index "weapons", ["base_skill_id"], name: "index_weapons_on_base_skill_id", using: :btree
  add_index "weapons", ["base_skill_specialty_id"], name: "index_weapons_on_base_skill_specialty_id", using: :btree
  add_index "weapons", ["weapon_modification_id"], name: "index_weapons_on_weapon_modification_id", using: :btree

  add_foreign_key "active_skills", "base_skills"
  add_foreign_key "active_skills", "characters"
  add_foreign_key "base_skill_specialties", "base_skills"
  add_foreign_key "base_skills", "base_attributes"
  add_foreign_key "base_skills", "skill_groups"
  add_foreign_key "char_attributes", "base_attributes"
  add_foreign_key "char_attributes", "characters"
  add_foreign_key "character_details", "characters"
  add_foreign_key "characters", "users"
  add_foreign_key "defenses", "characters"
  add_foreign_key "reputations", "characters"
  add_foreign_key "skill_specialties", "base_skill_specialties"
  add_foreign_key "skill_specialties", "characters"
  add_foreign_key "weapons", "availabilities"
  add_foreign_key "weapons", "base_skill_specialties"
  add_foreign_key "weapons", "base_skills"
  add_foreign_key "weapons", "weapon_modifications"
end
