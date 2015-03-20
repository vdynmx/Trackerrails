class TrackStat
  include Mongoid::Document

  field :duration,  type: Time
  field :distance,  type: Float
  field :top_speed, type: Float
  field :avg_speed, type: Float
  field :min_altitude, type: Float
  field :max_altitude, type: Float
end
