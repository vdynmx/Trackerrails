class Point
  include Mongoid::Document

  # CUSTOM FIELDS
  field :latitude,          type: Float
  field :longtitude,        type: Float
  field :altitude,        type: Float
  field :speed,             type: Float
  field :timestamp,         type: DateTime

  field :distance_to_next , type: Float, default: 0
  # field :elevation,         type: Float
  ## field :bearing,           type: Float
  ## field :traversed_way,     type: Float
  ## field :percent,           type: Float # DO WE REALY NEED IT IN DB?
  ## field :timeinterval,      type: Float # ?
  # field :epoch,             type: Integer # OVERHEAD
  # field :segment,           type: Integer # ?
  # field :privacy_area,      type: Integer # ?
  # # # # # # # # #

  embeds_one :waypoint
  embedded_in :track
end
