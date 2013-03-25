class CreateHeartbeats < ActiveRecord::Migration
  def up
    create_table :heartbeats do |t|
      t.integer   :device_id
      t.float     :batt_voltage
      t.integer   :update_time
    end
  end

  def down
    drop_table :heartbeats
  end
end
