class RemoveDealerLotIdFromVehicles < ActiveRecord::Migration
  def up
    remove_column :vehicles, :dealer_lot_id
  end

  def down
  end
end
