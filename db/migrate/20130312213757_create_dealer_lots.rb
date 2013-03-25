class CreateDealerLots < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "dealer_lots"
  end
end
