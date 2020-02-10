FactoryGirl.define do
  factory :feedback do
    title { Faker::Lorem.paragraphs(number: 1).first }
    message { Faker::Lorem.paragraphs(number: 1).first }
  end
end
