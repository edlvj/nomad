class City < ApplicationRecord
  belongs_to :country
  has_many :topics
  has_one :rating
  
  after_save :add_geo
  
  mount_uploader :image, CityImageUploader
  validates :title, presence: true
  
  private
  
  def add_geo
    cord = GeocordService.new(self.title_eng).getCord 
    p cord
    self.update_attributes(lat: cord.lat, long: cord.long) if cord && cord.lat && cord.long
  end
end
