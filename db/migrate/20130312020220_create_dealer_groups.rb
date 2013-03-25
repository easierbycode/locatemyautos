class CreateDealerGroups < ActiveRecord::Migration
  def change
    create_table :dealer_groups do |t|
      t.string :subdomain

      t.timestamps
    end
  end
end
