FactoryGirl.define do
  factory :comic_book do
    title 'Captian America'
    issue '1'
    year 1994
    publisher 'Marvel Comics'
    author 'Bobby P.'
    artist 'Sath M.'
    description 'This is the BEST COMIC IN THE WORLD! '
    cover "#{Rails.root}/app/assets/images/deadpool_cover.jpg"
  end
end
