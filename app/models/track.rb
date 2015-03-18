class Track
  include Mongoid::Document

  embeds_many :points
end
