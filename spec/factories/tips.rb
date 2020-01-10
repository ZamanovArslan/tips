FactoryGirl.define do
  factory :tip do
    title { Faker::Quote.famous_last_words }
    anonym { Faker::Boolean.boolean(true_ratio: 0.8) }
    description { Faker::Lorem.paragraphs(number: 1).first }
    created_at { Faker::Date.between(from: 2.months.ago, to: Time.zone.today) }
    experience { rand(10) }
    life_area { LifeArea.order("RANDOM()").first }
  end
end
