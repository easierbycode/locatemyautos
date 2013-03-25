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

ActiveRecord::Schema.define(:version => 20130322011221) do

  create_table "alerts", :force => true do |t|
    t.boolean  "checked",                                              :default => false
    t.integer  "device_id"
    t.integer  "driver_id"
    t.integer  "update_time"
    t.integer  "trip_start_at"
    t.decimal  "latitude",             :precision => 15, :scale => 10
    t.decimal  "longitude",            :precision => 15, :scale => 10
    t.integer  "event_type"
    t.string   "geofence_id"
    t.integer  "time_inside_geofence"
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
  end

  create_table "cars", :force => true do |t|
    t.string "year"
    t.string "make"
    t.string "model"
  end

  create_table "dealer_companies", :force => true do |t|
    t.string  "name"
    t.string  "country"
    t.string  "state"
    t.string  "city"
    t.string  "address"
    t.decimal "latitude",        :precision => 15, :scale => 10
    t.decimal "longitude",       :precision => 15, :scale => 10
    t.integer "dealer_group_id"
  end

  create_table "dealer_groups", :force => true do |t|
    t.string   "subdomain"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.decimal  "latitude",   :precision => 15, :scale => 10
    t.decimal  "longitude",  :precision => 15, :scale => 10
  end

  create_table "dealer_lots", :force => true do |t|
    t.string  "name"
    t.integer "dealer_company_id"
    t.string  "region"
    t.string  "country"
    t.string  "state"
    t.string  "city"
    t.string  "address"
    t.decimal "latitude",          :precision => 15, :scale => 10
    t.decimal "longitude",         :precision => 15, :scale => 10
  end

  create_table "device_histories", :force => true do |t|
    t.integer  "device_id"
    t.string   "obd_vin"
    t.integer  "power_on_at"
    t.integer  "time_gap"
    t.float    "odometer"
    t.float    "miles_gap"
    t.float    "gps_miles_gap"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "devices", :force => true do |t|
    t.integer  "type_id"
    t.string   "imei"
    t.string   "msisdn"
    t.string   "sim_status"
    t.integer  "activated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "latest_history_id"
  end

  create_table "heartbeats", :force => true do |t|
    t.integer "device_id"
    t.float   "batt_voltage"
    t.integer "update_time"
  end

  create_table "historical_trips", :force => true do |t|
    t.integer  "status",               :default => 0
    t.integer  "device_id"
    t.integer  "key_fob_id",           :default => 0
    t.integer  "start_at",             :default => 0
    t.integer  "end_at",               :default => 0
    t.integer  "duration",             :default => 0
    t.float    "miles",                :default => 0.0
    t.integer  "num_hard_brakes",      :default => 0
    t.integer  "num_hard_accel",       :default => 0
    t.integer  "num_speed_events",     :default => 0
    t.integer  "num_rpm_events",       :default => 0
    t.integer  "ending_mileage",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.float    "highest_speed",        :default => 0.0
    t.integer  "idle_mins",            :default => 0
    t.string   "time_zone"
    t.date     "end_date"
    t.integer  "qos_flags",            :default => 0
    t.integer  "num_corner_l"
    t.integer  "num_corner_r"
    t.integer  "num_very_hard_brakes", :default => 0
    t.integer  "num_very_hard_accel",  :default => 0
    t.integer  "num_hard_corner_l"
    t.integer  "num_hard_corner_r"
    t.float    "fuel_gal_start"
    t.float    "fuel_gal_end"
  end

  create_table "hours", :force => true do |t|
    t.string  "day"
    t.integer "open",  :default => 7
    t.integer "close", :default => 18
  end

  create_table "readings", :force => true do |t|
    t.integer "mobile_id"
    t.integer "update_time"
    t.float   "rssi"
    t.float   "altitude"
    t.decimal "latitude",    :precision => 15, :scale => 10
    t.decimal "longitude",   :precision => 15, :scale => 10
    t.float   "speed"
    t.float   "heading"
    t.integer "satellites"
    t.float   "hdop"
    t.integer "event_code"
    t.string  "fix_status"
    t.string  "unit_status"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "vehicle_assignments", :force => true do |t|
    t.integer "vehicle_id"
    t.integer "device_id"
    t.integer "start_at"
    t.integer "end_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "vin"
    t.datetime "acquired_date"
    t.datetime "sold_date"
    t.string   "vehicle_type"
    t.string   "vehicle_usage"
    t.string   "vehicle_status"
    t.string   "vehicle_location"
    t.string   "car_color"
    t.integer  "vehicle_mileage"
    t.decimal  "garage_loc_lat",   :precision => 15, :scale => 10
    t.decimal  "garage_loc_long",  :precision => 15, :scale => 10
    t.integer  "car_id"
    t.datetime "ship_start"
    t.datetime "ship_end"
  end

end
