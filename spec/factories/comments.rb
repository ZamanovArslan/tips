FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraphs(number: 1).first }
  end
end
