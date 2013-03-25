class Vehicle < ActiveRecord::Base

  attr_protected :created_at

  has_one :device

  belongs_to :dealer_lot

end