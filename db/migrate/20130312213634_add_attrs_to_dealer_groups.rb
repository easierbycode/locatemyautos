class AddAttrsToDealerGroups < ActiveRecord::Migration
  def change
    change_table "dealer_groups" do |t|
      t.string  "name"
      t.string  "country"
      t.string  "state"
      t.string  "city"
      t.string  "address"
      t.decimal "latitude",  :precision => 15, :scale => 10
      t.decimal "longitude", :precision => 15, :scale => 10
    end
  end
end
