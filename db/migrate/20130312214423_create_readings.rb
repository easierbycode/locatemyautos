class CreateReadings < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "readings"
  end
end
