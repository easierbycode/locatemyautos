class CreateDealerCompanies < ActiveRecord::Migration
  def up
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
  end

  def down
    drop_table "dealer_companies"
  end
end
