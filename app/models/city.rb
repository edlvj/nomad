class City < ApplicationRecord
  belongs_to :country
  has_many :topic
  has_one :rating
  
  mount_uploader :image, CityImageUploader
  validates :title, presence: true
end
