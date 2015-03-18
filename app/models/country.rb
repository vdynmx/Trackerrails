class Country
  include Mongoid::Document

  # CUSTOM FIELDS
  field :name,  type: String
  field :iso_2, type: String
  field :iso_3, type: String
  # # # # # # #

  # RELATIONS
  belongs_to_many :users
  # # # # # #

end
