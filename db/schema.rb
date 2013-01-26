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

ActiveRecord::Schema.define(:version => 20130112161643) do

  create_table "messages", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "room_id",    :null => false
    t.text     "contents",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["room_id", "user_id"], :name => "index_messages_on_room_id_and_user_id"

  create_table "people", :force => true do |t|
    t.integer  "user_id"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "people", ["user_id"], :name => "index_people_on_user_id", :unique => true

  create_table "room_users", :force => true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "room_users", ["room_id", "user_id"], :name => "index_room_users_on_room_id_and_user_id", :unique => true

  create_table "rooms", :force => true do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "contents"
    t.text     "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.text     "provider",   :null => false
    t.text     "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end
