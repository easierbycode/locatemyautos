class Alert < ActiveRecord::Base

  EVENT_TYPES = [
      :speed,
      :brake,
      :accel,
      :corner_l,
      :corner_r,
      :geofence
  ]

end