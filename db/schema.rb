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

ActiveRecord::Schema.define(:version => 20130126022551) do

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
    t.integer  "obtained_occurrence_id"
    t.integer  "used_occurrence_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "requirement_id"
  end

  add_index "character_requirements", ["character_id"], :name => "index_character_requirements_on_character_id"
  add_index "character_requirements", ["obtained_occurrence_id"], :name => "index_character_requirements_on_obtained_occurrence_id"
  add_index "character_requirements", ["requirement_id"], :name => "index_character_requirements_on_requirement_id"
  add_index "character_requirements", ["used_occurrence_id"], :name => "index_character_requirements_on_used_occurrence_id"

  create_table "character_rewards", :force => true do |t|
    t.integer  "character_id"
    t.integer  "reward_id"
    t.integer  "occurrence_id"
    t.integer  "preference"
    t.boolean  "obtained"
    t.integer  "reward_cycle"
    t.float    "obtained_points"
    t.string   "remarks"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "member_id"
  end

  add_index "character_rewards", ["character_id"], :name => "index_character_rewards_on_character_id"
  add_index "character_rewards", ["member_id"], :name => "index_character_rewards_on_member_id"
  add_index "character_rewards", ["obtained"], :name => "index_character_rewards_on_obtained"
  add_index "character_rewards", ["occurrence_id"], :name => "index_character_rewards_on_occurrence_id"
  add_index "character_rewards", ["reward_id"], :name => "index_character_rewards_on_reward_id"

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.integer  "member_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "race_id"
    t.integer  "sex"
    t.integer  "current_points", :default => 0
    t.integer  "total_points",   :default => 0
  end

  add_index "characters", ["member_id"], :name => "index_characters_on_member_id"
  add_index "characters", ["race_id"], :name => "index_characters_on_race_id"

  create_table "event_attendances", :force => true do |t|
    t.integer  "occurrence_id"
    t.integer  "character_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "character_job_id"
  end

  add_index "event_attendances", ["character_id"], :name => "index_event_attendances_on_character_id"
  add_index "event_attendances", ["character_job_id"], :name => "index_event_attendances_on_character_job_id"
  add_index "event_attendances", ["occurrence_id"], :name => "index_event_attendances_on_occurrence_id"

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

  add_index "event_rewards", ["event_id"], :name => "index_event_rewards_on_event_id"
  add_index "event_rewards", ["reward_id"], :name => "index_event_rewards_on_reward_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "points"
    t.string   "remarks"
    t.boolean  "hidden"
    t.time     "time"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "requirements_mixable"
    t.integer  "failure_points"
  end

  add_index "events", ["hidden"], :name => "index_events_on_hidden"
  add_index "events", ["name"], :name => "index_events_on_name"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jobs", ["name"], :name => "index_jobs_on_name"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.date     "join_date"
    t.string   "url"
    t.string   "remarks"
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "reward_cycle",    :default => 1
    t.date     "cycle_date"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "leader"
    t.integer  "current_points",  :default => 0
    t.integer  "total_points",    :default => 0
  end

  add_index "members", ["active"], :name => "index_members_on_active"
  add_index "members", ["admin"], :name => "index_members_on_admin"
  add_index "members", ["leader"], :name => "index_members_on_leader"
  add_index "members", ["name"], :name => "index_members_on_name"

  create_table "news", :force => true do |t|
    t.text     "text"
    t.datetime "date"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["date"], :name => "index_news_on_date"
  add_index "news", ["member_id"], :name => "index_news_on_member_id"

  create_table "occurrences", :force => true do |t|
    t.string   "remarks"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "success"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "member_id"
    t.boolean  "optional"
    t.integer  "bonus_points"
  end

  add_index "occurrences", ["end_time"], :name => "index_occurrences_on_end_time"
  add_index "occurrences", ["event_id"], :name => "index_occurrences_on_event_id"
  add_index "occurrences", ["member_id"], :name => "index_occurrences_on_member_id"
  add_index "occurrences", ["optional"], :name => "index_occurrences_on_optional"
  add_index "occurrences", ["success"], :name => "index_occurrences_on_success"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "races", ["name"], :name => "index_races_on_name"

  create_table "requirement_obtainments", :force => true do |t|
    t.integer  "event_id"
    t.integer  "requirement_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "requirement_obtainments", ["event_id"], :name => "index_requirement_obtainments_on_event_id"
  add_index "requirement_obtainments", ["requirement_id"], :name => "index_requirement_obtainments_on_requirement_id"

  create_table "requirements", :force => true do |t|
    t.string   "name"
    t.boolean  "reusable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "multiple"
  end

  add_index "requirements", ["name"], :name => "index_requirements_on_name"

  create_table "rewards", :force => true do |t|
    t.string   "name"
    t.integer  "external_value"
    t.string   "remarks"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rewards", ["name"], :name => "index_rewards_on_name"

  create_table "shouts", :force => true do |t|
    t.text     "text"
    t.datetime "date"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shouts", ["date"], :name => "index_shouts_on_date"
  add_index "shouts", ["member_id"], :name => "index_shouts_on_member_id"

  create_table "site_configs", :force => true do |t|
    t.string   "site_name"
    t.string   "password_digest"
    t.text     "description"
    t.string   "config_comment"
    t.string   "members",         :default => "Members"
    t.string   "events",          :default => "Events"
    t.string   "rewards",         :default => "Rewards"
    t.string   "occurrences",     :default => "Occurrences"
    t.string   "jobs",            :default => "Jobs"
    t.string   "races",           :default => "Races"
    t.string   "requirements",    :default => "Requirements"
    t.integer  "dkp_system",      :default => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

end
