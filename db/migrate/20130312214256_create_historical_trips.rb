class CreateHistoricalTrips < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "historical_trips"
  end
end
