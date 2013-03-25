class CreateVehicleAssignments < ActiveRecord::Migration
  def up
    create_table "vehicle_assignments", :force => true do |t|
      t.integer "vehicle_id"
      t.integer "device_id"
      t.integer "start_at"
      t.integer "end_at"
    end
  end

  def down
    drop_table "vehicle_assignments"
  end
end
