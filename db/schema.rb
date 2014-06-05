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

ActiveRecord::Schema.define(:version => 20140605130306) do

  create_table "games", :force => true do |t|
    t.integer  "team1_id",      :precision => 38, :scale => 0
    t.integer  "team2_id",      :precision => 38, :scale => 0
    t.string   "group"
    t.integer  "double_points", :precision => 38, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "tournament_id", :precision => 38, :scale => 0
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "group"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "tournament_id", :precision => 38, :scale => 0
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "type"
  end

  create_table "user_games", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.integer  "game_id",       :precision => 38, :scale => 0
    t.string   "result"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.decimal  "tournament_id"
  end

  create_table "user_questions", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.integer  "question_id",   :precision => 38, :scale => 0
    t.string   "answer"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "tournament_id", :precision => 38, :scale => 0
  end

  create_table "user_results", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.integer  "tournament_id", :precision => 38, :scale => 0
    t.integer  "points",        :precision => 38, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "user_teams", :force => true do |t|
    t.integer  "user_id",       :precision => 38, :scale => 0
    t.integer  "team_id",       :precision => 38, :scale => 0
    t.string   "criteria"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "result"
    t.integer  "tournament_id", :precision => 38, :scale => 0
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
