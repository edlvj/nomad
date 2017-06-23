class Topic < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :comments
  
  validates :title, :text, presence: true
end
