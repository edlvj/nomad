class FinRequirement < ApplicationRecord
  belongs_to :country
  
  validates :cost, presence: true
end
