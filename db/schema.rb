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

ActiveRecord::Schema.define(version: 20130814143827) do

  create_table "notes", force: true do |t|
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_votes",  default: 0
  end

  create_table "tag_associations", force: true do |t|
    t.integer  "note_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
