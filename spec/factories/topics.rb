FactoryGirl.define do
  factory :topic do
    title 'topic'
    text 'text'
  end
  
  trait :with_city do
    city { create :city, :with_country }
  end  
end
