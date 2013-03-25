class CreateAlerts < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "alerts"
  end
end
