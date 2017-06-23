FactoryGirl.define do
  factory :country do
    title 'Ukraine'
  end
  
  trait :with_region do
    region { create :region }
  end
end
