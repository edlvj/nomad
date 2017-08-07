FactoryGirl.define do
  factory :city do
    title "Berlin"
    title_eng "Berlin"
    image '/fallback/default.png'
  end
  
  trait :with_country do
    country { create :country, :with_region }
  end
end
