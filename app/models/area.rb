class Area
  include Mongoid::Document

  # CUSTOM FIELDS
  # field :idx, type: Integer # ?
  field :label, type: String
  field :center_lat, Float
  field :center_lng, type: Float
  field :radius, type: Float
  # # # # # # # #

  # RELATIONS
  embeds_one :point
  # # # # # #
end
