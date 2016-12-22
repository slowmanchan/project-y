FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    bio "Sample"
    location "Toronto"
    # level "beginner"
    # agenda "teamwork"
    # tech "Rails"

    trait :admin do
      admin true
    end
  end
end
