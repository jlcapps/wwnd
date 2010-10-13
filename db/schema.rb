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

ActiveRecord::Schema.define(:version => 20101013181715) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "display_name"
    t.text     "bio"
    t.string   "slug"
    t.boolean  "active",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["slug"], :name => "index_authors_on_slug"

  create_table "chunks", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.string   "title"
    t.string   "as_by"
    t.integer  "author_id"
    t.string   "translator"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "editor"
    t.string   "year"
    t.string   "asin"
  end

end
