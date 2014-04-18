# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :header do |n|
    Faker::Lorem.sentence
  end

  sequence :content do |n|
    Faker::Lorem.paragraph
  end

  factory :post do
  header
  content
  end
end
