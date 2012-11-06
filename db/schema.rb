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

ActiveRecord::Schema.define(:version => 20121104021456) do

  create_table "character_jobs", :force => true do |t|
    t.integer  "character_id"
    t.integer  "job_id"
    t.integer  "level"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "character_jobs", ["character_id"], :name => "index_character_jobs_on_character_id"
  add_index "character_jobs", ["job_id"], :name => "index_character_jobs_on_job_id"

  create_table "character_requirements", :force => true do |t|
    t.integer  "character_id"
    t.boolean  "used"
    t.integer  "obtained_event_occurrence_id"
    t.integer  "used_event_occurrence_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "character_requirements", ["character_id"], :name => "index_character_requirements_on_character_id"
  add_index "character_requirements", ["obtained_event_occurrence_id"], :name => "index_character_requirements_on_obtained_event_occurrence_id"
  add_index "character_requirements", ["used_event_occurrence_id"], :name => "index_character_requirements_on_used_event_occurrence_id"

  create_table "character_rewards", :force => true do |t|
    t.integer  "character_id"
    t.integer  "reward_id"
    t.integer  "event_occurrence_id"
    t.integer  "preference"
    t.boolean  "obtained"
    t.integer  "reward_cycle"
    t.integer  "obtained_points"
    t.string   "remarks"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "character_rewards", ["character_id"], :name => "index_character_rewards_on_character_id"
  add_index "character_rewards", ["event_occurrence_id"], :name => "index_character_rewards_on_event_occurrence_id"
  add_index "character_rewards", ["reward_id"], :name => "index_character_rewards_on_reward_id"

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "race_id"
    t.integer  "sex"
  end

  add_index "characters", ["race_id"], :name => "index_characters_on_race_id"

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
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_requirements", :force => true do |t|
    t.integer  "requirement_id"
    t.integer  "event_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "event_requirements", ["event_id"], :name => "index_event_requirements_on_event_id"
  add_index "event_requirements", ["requirement_id"], :name => "index_event_requirements_on_requirement_id"

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
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "requirements_mixable"
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.date     "join_date"
    t.string   "url"
    t.string   "remarks"
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "reward_cycle"
    t.date     "cycle_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "leader"
  end

  create_table "news", :force => true do |t|
    t.text     "text"
    t.datetime "date"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["member_id"], :name => "index_news_on_member_id"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requirement_obtainments", :force => true do |t|
    t.integer  "event_id"
    t.integer  "requirement_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "requirement_obtainments", ["event_id"], :name => "index_requirement_obtainments_on_event_id"
  add_index "requirement_obtainments", ["requirement_id"], :name => "index_requirement_obtainments_on_requirement_id"

  create_table "requirements", :force => true do |t|
    t.text     "name"
    t.boolean  "reusable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rewards", :force => true do |t|
    t.string   "name"
    t.integer  "external_value"
    t.string   "remarks"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "shouts", :force => true do |t|
    t.text     "text"
    t.datetime "date"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shouts", ["member_id"], :name => "index_shouts_on_member_id"

end
