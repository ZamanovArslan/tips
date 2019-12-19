FactoryGirl.define do
  factory :tip do
    title { Faker::Quote.famous_last_words }
    anonym { Faker::Boolean.boolean(true_ratio: 0.8) }
    description { Faker::Lorem.paragraphs(number: 1).first }
    created_at { Faker::Date.between(from: 2.month.ago, to: Date.today) }
    experience { rand(10) }
    life_area_id { rand(17) + 1 }
  end
end