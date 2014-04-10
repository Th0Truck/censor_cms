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

ActiveRecord::Schema.define(version: 20140403151923) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.integer  "page_id"
    t.integer  "setting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "header"
    t.text     "article"
    t.integer  "user_id"
    t.integer  "order"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload"
  end

  create_table "sections_sidebars", force: true do |t|
    t.string   "section_id"
    t.string   "sidebar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "domain"
    t.string   "name"
    t.integer  "login"
    t.integer  "footer"
    t.text     "info"
    t.string   "analytics_api"
    t.string   "facebook"
    t.string   "googleplus"
    t.string   "linkedin"
    t.integer  "homepage",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sidebars", force: true do |t|
    t.string   "setting_id"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upload_sections", force: true do |t|
    t.integer  "section_id"
    t.integer  "upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "file"
    t.string   "title"
    t.integer  "size"
    t.string   "filetype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_pages", force: true do |t|
    t.integer  "page_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sections", force: true do |t|
    t.integer  "section_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "uid"
    t.string   "provider"
    t.string   "icon"
    t.integer  "account_id",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
