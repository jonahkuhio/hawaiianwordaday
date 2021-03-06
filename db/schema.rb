# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100418021302) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "email_subscriptions", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "email_subscriptions", ["token"], :name => "index_email_subscriptions_on_token"

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "unused_words", :force => true do |t|
    t.string   "word"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "word_in_context"
  end

  create_table "users", :force => true do |t|
    t.string "login"
    t.string "password"
    t.string "email"
  end

  create_table "words", :force => true do |t|
    t.string   "term"
    t.float    "price"
    t.string   "definition"
    t.text     "word_in_context"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
  end

end
