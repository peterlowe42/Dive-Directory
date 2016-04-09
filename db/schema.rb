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

ActiveRecord::Schema.define(version: 20160409201150) do

  create_table "divesite_locations", force: :cascade do |t|
    t.integer  "divesite_id"
    t.integer  "location_id"
    t.string   "distance"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "divesites", force: :cascade do |t|
    t.string   "site_name"
    t.string   "lat"
    t.string   "lng"
    t.string   "source_id"
    t.integer  "max_depth"
    t.integer  "min_depth"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "divesite_id"
    t.integer  "rating"
    t.string   "title"
    t.text     "body"
    t.date     "dive_date"
    t.integer  "vis"
    t.integer  "temp"
    t.string   "current"
    t.string   "waves"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.integer  "no_of_dives"
    t.string   "pic_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "activation_digest"
    t.boolean  "activated"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "up"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
