# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    name "Takamina Blog"
    url "http://www.akb48.com/takamina"
    rss "http://www.akb48.com/takamina/feed"
  end
end
