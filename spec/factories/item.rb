FactoryBot.define do
  factory :item do
    name {"Amazon echo white"}
    price {"3000"}
    # created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end