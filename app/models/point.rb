class Point
  include Mongoid::Document

  field :latitude,          type: Float
  field :longtitude,        type: Float

  field :elevation,         type: Float
  field :bearing,           type: Float
  field :distance_to_prev,  type: Float
  field :distance_to_next , type: Float # OVERHEAD
  field :traversed_way,     type: Float
  field :speed,             type: Float
  field :percent,           type: Float # DO WE REALY NEED IT IN DB?
  field :timeinterval,      type: Float # ?
  field :timestamp,         type: DateTime
  field :epoch,             type: Integer # ?
  field :segment,           type: Integer # ?
  field :privacy_area,      type: Integer # ?

  embedded_in :track
end
