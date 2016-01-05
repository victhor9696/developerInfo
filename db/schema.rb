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

ActiveRecord::Schema.define(version: 20160105154033) do

  create_table "comment_news", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.integer  "news_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "locale_id",  limit: 4
  end

  create_table "comment_videos", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.integer  "video_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     limit: 4
    t.integer  "locale_id",  limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title_br",       limit: 255
    t.string   "title_es",       limit: 255
    t.text     "description_br", limit: 65535
    t.text     "description_es", limit: 65535
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",         limit: 4
    t.string   "slug",           limit: 255
  end

  add_index "news", ["slug"], name: "index_news_on_slug", unique: true, using: :btree

  create_table "news_avaliables", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "news_id",    limit: 4
    t.integer  "score",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "news_tags", force: :cascade do |t|
    t.integer "news_id",   limit: 4
    t.integer "tag_id",    limit: 4
    t.integer "locale_id", limit: 4
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.string   "url",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.integer "user_id",   limit: 4
    t.integer "status",    limit: 4
    t.integer "locale_id", limit: 4
  end

  create_table "tags_videos", force: :cascade do |t|
    t.integer "video_id",  limit: 4
    t.integer "tag_id",    limit: 4
    t.integer "locale_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     limit: 4
    t.integer  "role",       limit: 4
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "video_avaliables", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "video_id",   limit: 4
    t.integer  "score",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string  "title_br",       limit: 255
    t.string  "title_es",       limit: 255
    t.text    "description_br", limit: 65535
    t.text    "description_es", limit: 65535
    t.string  "iframe",         limit: 255
    t.string  "slug",           limit: 255
    t.integer "user_id",        limit: 4
    t.integer "status",         limit: 4
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree

end
