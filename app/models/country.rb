class Country < ApplicationRecord
  belongs_to :region
  
  validates :title, presence: true
end
