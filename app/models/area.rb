class Area
  include Mongoid::Document

  # CUSTOM FIELDS
  # field :idx, type: Integer # ?
  field :label, type: String
  field :radius, type: Float
  # # # # # # # #

  # RELATIONS
  embeds_one :point, as: :center
  # # # # # #
end
