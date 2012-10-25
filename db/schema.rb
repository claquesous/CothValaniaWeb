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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121025170814) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.boolean  "war"
    t.boolean  "mnk"
    t.boolean  "thf"
    t.boolean  "whm"
    t.boolean  "blm"
    t.boolean  "rdm"
    t.boolean  "pld"
    t.boolean  "drk"
    t.boolean  "bst"
    t.boolean  "brd"
    t.boolean  "rng"
    t.boolean  "sam"
    t.boolean  "nin"
    t.boolean  "drg"
    t.boolean  "smn"
    t.boolean  "blu"
    t.boolean  "cor"
    t.boolean  "pup"
    t.boolean  "dnc"
    t.boolean  "sch"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_attendances", :force => true do |t|
    t.integer  "event_occurrence_id"
    t.integer  "character_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "event_attendances", ["character_id"], :name => "index_event_attendances_on_character_id"
  add_index "event_attendances", ["event_occurrence_id"], :name => "index_event_attendances_on_event_occurrence_id"

  create_table "event_occurrences", :force => true do |t|
    t.string   "remarks"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "success"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_rewards", :force => true do |t|
    t.integer  "event_id"
    t.integer  "reward_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "points"
    t.string   "remarks"
    t.boolean  "hidden"
    t.time     "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.date     "join_date"
    t.string   "url"
    t.string   "remarks"
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "reward_cycle"
    t.date     "cycle_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rewards", :force => true do |t|
    t.string   "name"
    t.integer  "external_value"
    t.string   "remarks"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
