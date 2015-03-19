class Waypoint
  include Mongoid::Document

  # CUSTOM FIELDS
  # field :idx, type: Integer # ?
  field :title, type: String
  field :description, type: String
  field :street, type: String
  field :postal_code, type: String
  field :city, type: String
  field :country, type: String
  field :state, type: String
  field :iso_code, type: String
  # # # # # # # #

  # RELATIONS
  embeds_one :point
  # # # # # #
end
