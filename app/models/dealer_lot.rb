class DealerLot < ActiveRecord::Base

  attr_protected :created_at

  belongs_to :dealer_company

  has_many :vehicles
end