class CreateHours < ActiveRecord::Migration
  def up
    create_table :hours do |t|
      t.string :day
      t.integer :open, :default => 7
      t.integer :close, :default => 18
    end

    [:mon, :tue, :wed, :thu, :fri].each do |day|
      Hours.create! day: day
    end

    Hours.create! day: :sat, open: 8, close: 13

  end

  def down
    drop_table :hours
  end
end
