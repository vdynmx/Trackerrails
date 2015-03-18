class Achivement
  include Mongoid::Document

  field :distance, type: Float
  field :avarage_speed, type: Float
  field :top_speed, type: Float
  field :time_active, type: Float
end
