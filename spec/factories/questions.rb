FactoryBot.define do
    factory :question do
      question { Faker::Lorem.word }
      answer { Faker::Lorem.character }
      quiz_id { 2 }
    end
  end