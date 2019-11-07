FactoryBot.define do
    factory :quiz do
      title { Faker::Lorem.word }
      created_by { Faker::Lorem.word }
      difficulty { 2 }
    end
  end
  