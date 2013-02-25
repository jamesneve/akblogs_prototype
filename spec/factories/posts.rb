# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    image "MyString"
    content "MyText"
    site_id 1
  end
end
