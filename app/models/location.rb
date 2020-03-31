class Location < ApplicationRecord
  belongs_to :location_type
  has_many :specials
end
