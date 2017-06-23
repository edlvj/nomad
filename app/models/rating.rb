class Rating < ApplicationRecord
  belongs_to :city
  
  RATING_TYPES = ['quality_life', 'fun', 'safe', 'toward']
  
  validates :rate_type, inclusion: { in: RATING_TYPES,
    message: "%{value} is not a valid type" }
end
