class Waypoint
  include Mongoid::Document

  # CUSTOM FIELDS
  # field :idx, type: Integer # ?
  field :title, type: String
  field :description, type: String
  field :country, type: String
  field :city, type: String
  field :state, type: String
  field :street, type: String
  field :iso_code, type: String
  field :postal_code, type: String
  # # # # # # # #

  # RELATIONS
  embedded_in :point
  # # # # # #
end
