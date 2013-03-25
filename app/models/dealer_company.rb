class DealerCompany < ActiveRecord::Base

  attr_protected :created_at

  has_many :dealer_lots
  belongs_to :dealer_group

end