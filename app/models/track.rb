class Track
  include Mongoid::Document

  # ODM CALLBACKS
  before_save { |record| calculate_track_stats record }
  # # # # # # # #

  # SCOPES
  scope :owned_by, ->(owner_id) { where(user_id: owner_id) }
  # # # # #

  # CUSTOM FIELDS
  field :title, type: String
  field :description, type: String
  field :device, type: String # for what purpose ?
  field :private, type: Boolean
  field :timestamp, type: DateTime
  field :recover, type: Boolean
  # column "ip", :string # ?
  ## field :duration, type: Integer
  ## field :moving_time, type: Integer
  ## field :speed_avg, type: float
  # field :moving_speed_avg, type: float # OVERHEAD
  ## field :speed_max, type: float
  ## field :elevation_max, type: float
  ## field :elevation_min, type: float
  ## field :elevation_gain, type: float
  ## field :grade_max, type: float
  ## field :grade_min, type: float
  ## field :total_dist, type: float
  ## field :verticles, type: integer
  ## field :segments_count, type: Integer
  # field :cache_hash, type: string # ???
  # field :privacy_option, type: String # ?
  # # # # # # # # #

  # REFERENES
  belongs_to :user
  embeds_many :points
  embeds_one :track_stat
  # # # # # # # # # #

  private

  def calculate_track_stats track
    points = track.points
    stats = {
      duration: Time.at(points.last.timestamp.to_f - points.first.timestamp.to_f),
      distance: 0.0,
      top_speed: 0.0,
      min_altitude: 9000.0,
      max_altitude: -1000
    }

    speed_acc = 0.0

    points.each do |point|
      stats[:distance] += point.distance_to_next
      stats[:top_speed] = point.speed if point.speed > stats[:top_speed]
      stats[:min_altitude] = point.altitude if point.altitude < stats[:min_altitude]
      stats[:max_altitude] = point.altitude if point.altitude > stats[:max_altitude]
      speed_acc += point.speed
    end

    stats[:avg_speed] = points.try(:any?) ? speed_acc / points.count : 0

    track.build_track_stat stats
  end
end
