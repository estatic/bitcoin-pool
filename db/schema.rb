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

ActiveRecord::Schema.define(:version => 20110608195953) do

  create_table "blocks", :force => true do |t|
    t.integer  "number"
    t.string   "checksum",                                                      :null => false
    t.datetime "found_at",                                                      :null => false
    t.decimal  "generated",     :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.integer  "worker_id"
    t.integer  "share_id"
    t.integer  "confirmations",                                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pps"
    t.boolean  "orphan"
  end

  add_index "blocks", ["checksum"], :name => "index_blocks_on_checksum", :unique => true

  create_table "contributions", :force => true do |t|
    t.integer  "block_id"
    t.integer  "worker_id"
    t.decimal  "score",      :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",     :precision => 16, :scale => 8, :default => 0.0
  end

  create_table "payments", :force => true do |t|
    t.decimal  "amount",         :precision => 16, :scale => 8, :default => 0.0, :null => false
    t.integer  "user_id",                                                        :null => false
    t.string   "address",                                                        :null => false
    t.string   "transaction_id",                                                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "value",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "share_prices", :force => true do |t|
    t.datetime "starts_at",                                                  :null => false
    t.datetime "ends_at",                                                    :null => false
    t.decimal  "price",      :precision => 16, :scale => 8, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shares", :force => true do |t|
    t.text     "rem_host",        :null => false
    t.text     "username",        :null => false
    t.text     "our_result"
    t.text     "upstream_result"
    t.text     "reason"
    t.text     "solution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", :force => true do |t|
    t.string   "metric",      :null => false
    t.float    "value",       :null => false
    t.integer  "worker_id"
    t.integer  "user_id"
    t.datetime "recorded_at", :null => false
  end

  add_index "statistics", ["recorded_at"], :name => "index_statistics_on_recorded_at"

  create_table "users", :force => true do |t|
    t.string   "email",                                                                :default => "",  :null => false
    t.string   "encrypted_password",     :limit => 128,                                :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick"
    t.string   "address"
    t.boolean  "admin"
    t.decimal  "payment_treshold",                      :precision => 16, :scale => 8, :default => 0.0
    t.decimal  "price",                                 :precision => 16, :scale => 8, :default => 0.0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workers", :force => true do |t|
    t.string   "username",   :limit => 128, :null => false
    t.string   "password",   :limit => 128, :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pps"
  end

end
