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

ActiveRecord::Schema.define(version: 20150127100546) do

  create_table "access_tokens", force: true do |t|
    t.integer  "account_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_tokens", ["account_id"], name: "access_tokens_account_id_fk", using: :btree
  add_index "access_tokens", ["client_id"], name: "access_tokens_client_id_fk", using: :btree
  add_index "access_tokens", ["refresh_token_id"], name: "access_tokens_refresh_token_id_fk", using: :btree

  create_table "accounts", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "account_id"
    t.string   "identifier"
    t.string   "secret"
    t.string   "name"
    t.string   "website"
    t.string   "redirect_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refresh_tokens", force: true do |t|
    t.integer  "account_id"
    t.integer  "client_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "access_tokens", "accounts", name: "access_tokens_account_id_fk"
  add_foreign_key "access_tokens", "clients", name: "access_tokens_client_id_fk"
  add_foreign_key "access_tokens", "refresh_tokens", name: "access_tokens_refresh_token_id_fk"

end
