class DeviceHistory < ActiveRecord::Base
  belongs_to :device

  attr_protected :created_at
end