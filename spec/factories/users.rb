FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "generic_superhero_reference#{n}@gmail.com" }
    password 'secret123'
    password_confirmation 'secret123'
    role 'user'
  end

  factory :admin, class: User do
    sequence(:email) { |n| "admin#{n}@gmail.com" }
    password 'secret123'
    password_confirmation 'secret123'
    role 'admin'
  end
end
