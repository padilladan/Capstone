class Special < ApplicationRecord
  belongs_to :location
  belongs_to :special_types
  validates :name, presence: true
  validates :price, presence: true
  validates :special_type_id, presence: true
  validates :location_id, presence: true
end

