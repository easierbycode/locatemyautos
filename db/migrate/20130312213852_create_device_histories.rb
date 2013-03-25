class CreateDeviceHistories < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "device_histories"
  end
end
