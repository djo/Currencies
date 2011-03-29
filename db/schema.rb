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

ActiveRecord::Schema.define(:version => 20110329013445) do

  create_table "appointments", :force => true do |t|
    t.boolean  "visited",     :default => false, :null => false
    t.integer  "currency_id",                    :null => false
    t.integer  "country_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["country_id"], :name => "index_appointments_on_country_id"
  add_index "appointments", ["currency_id"], :name => "index_appointments_on_currency_id"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
