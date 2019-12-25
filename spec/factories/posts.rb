FactoryBot.define do
  factory :post do
    title { Faker::Team.name }
    content { Faker::Lorem.paragraph  }
    image { Faker::Avatar.image }

    trait :invalid do
      title { nil }
    end
  end
end
