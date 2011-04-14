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

ActiveRecord::Schema.define(:version => 20110414220342) do

  create_table "appointments", :force => true do |t|
    t.integer  "country_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :null => false
  end

  add_index "appointments", ["country_id", "user_id"], :name => "index_appointments_on_country_id_and_user_id", :unique => true
  add_index "appointments", ["country_id"], :name => "index_appointments_on_country_id"

  create_table "countries", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "code",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "currency_id", :null => false
  end

  add_index "countries", ["currency_id"], :name => "index_countries_on_currency_id"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "country_trips", :force => true do |t|
    t.integer  "country_id", :null => false
    t.integer  "trip_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "country_trips", ["country_id", "trip_id"], :name => "index_country_trips_on_country_id_and_trip_id", :unique => true

  create_table "currencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.text     "description",  :null => false
    t.date     "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      :null => false
  end

  add_index "trips", ["user_id"], :name => "index_trips_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
