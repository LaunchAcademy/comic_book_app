FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "generic_superhero_reference#{n}@gmail.com" }
    password 'secret123'
    password_confirmation 'secret123'
  end
end
