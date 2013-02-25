# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "No3b Concert"
    image "http://no3b.com/concert.png"
    content "There was a concert last night. Mii-chan did a backflip."
    site
  end
end
