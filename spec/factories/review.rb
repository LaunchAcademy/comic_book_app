FactoryGirl.define do
  factory :review do
    body 'This is a cool book!'
    rating 5
    comic_book
    user
  end
end
