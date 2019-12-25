FactoryBot.define do
  factory :post do
    title { "Test title" }
    content { "Test content" }
    image { "Test image" }

    trait :invalid do
      title { "Test title" }
    end
  end
end
