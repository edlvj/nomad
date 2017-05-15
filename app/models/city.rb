class City < ApplicationRecord
  belongs_to :country
  
  validates :title, presence: true
end
