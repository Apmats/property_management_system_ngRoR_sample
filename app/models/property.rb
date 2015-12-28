class Property < ActiveRecord::Base
  validates :name, length: { in: 1..60 }
  validates :description, length: { in: 1..200 }
  validates :address, length: { in: 1..255 }
  validates :property_type, length: { in: 1..255 }
  validates_inclusion_of :property_type, in: %w( Vacation City ),  message: "Type %{value} is not included in the list of available types"
  validates :floor, numericality: { only_integer: true }
  validates :floor, numericality: { greater_than_or_equal_to: 0,  message: "Flood value %{value} is invalid, floor should be a number, and it should be 1 or greater" }
end