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

ActiveRecord::Schema.define(version: 20160619224332) do

  create_table "ads", force: :cascade do |t|
    t.float    "budget",     limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "creatives", force: :cascade do |t|
    t.float    "bid",        limit: 24
    t.string   "adText",     limit: 255
    t.integer  "ad_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "creatives", ["ad_id"], name: "index_creatives_on_ad_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "place",        limit: 255
    t.integer  "targeting_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "places", ["targeting_id"], name: "index_places_on_targeting_id", using: :btree

  create_table "targetings", force: :cascade do |t|
    t.string   "gender",     limit: 255
    t.integer  "ad_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "targetings", ["ad_id"], name: "index_targetings_on_ad_id", using: :btree

  add_foreign_key "creatives", "ads"
  add_foreign_key "places", "targetings"
  add_foreign_key "targetings", "ads"
end
