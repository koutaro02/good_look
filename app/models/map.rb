class Map < ApplicationRecord
  has_many :users
  has_one_attached :image

  with_options presence: true do
    validates :spot_name
    validates :address
    validates :latitude
    validates :longitude

  end

  geocoded_by :address
  before_validation :geocode
end
