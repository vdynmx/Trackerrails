class Track
  include Mongoid::Document

  # CUSTOM FIELDS
  # column "ip", :string # ?
  field :title, type: String
  field :description, type: String
  field :device, type: String # for what purpose ?
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
  field :time_stamp, type: DateTime
  field :recover, type: Integer
  # # # # # # # # #

  # REFERENES
  belongs_to :user
  embeds_many :waytpoints
  embeds_many :points
  # # # # # # # # # #
end
