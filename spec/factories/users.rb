FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8) }
    password_confirmation { password }
    nickname 'dfdsfdfdfd'
  end
  
  trait :admin do
    admin true
  end
  
  trait :with_favorite do
    favorite { create :favorite }
  end
end
