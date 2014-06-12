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

ActiveRecord::Schema.define(version: 20140610034929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "poster_comment"
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "poster"
    t.integer  "count_read"
    t.integer  "count_liked"
    t.string   "category"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "poster_uid"
    t.string   "poster_profile_url"
    t.integer  "votes_count"
  end

  create_table "ratings", force: true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "score"
    t.string   "default"
    t.string   "0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["comment_id"], name: "index_ratings_on_comment_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "user"
    t.string   "name"
    t.string   "team"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "votes", force: true do |t|
    t.integer  "cards_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
