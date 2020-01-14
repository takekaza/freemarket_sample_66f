FactoryBot.define do
  pass = Faker::Internet.password(6)
  
  factory :user do
    id                    {"6"}
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {pass}
    password_confirmation {pass}
    created_at            {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    updated_at            {Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  
  end

end