class Device < ActiveRecord::Base
  attr_accessible :type_id, :imei, :msisdn, :sim_status, :policy_id, :vehicle_id, :activated_at, :name, :tamper_event_id

  has_many :device_histories
  has_many :historical_trips

  belongs_to :vehicle

  def latest_vin
    device_histories.last.obd_vin
  end

  def trip_count
    historical_trips.count
  end
end
