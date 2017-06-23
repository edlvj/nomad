class Country < ApplicationRecord
  belongs_to :region
  has_one :fin_requirement
  
  validates :title, presence: true
end
