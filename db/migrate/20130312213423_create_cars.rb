class CreateCars < ActiveRecord::Migration
  def up
    create_table "cars", :force => true do |t|
      t.string "year"
      t.string "make"
      t.string "model"
    end
  end

  def down
    drop_table "cars"
  end
end
