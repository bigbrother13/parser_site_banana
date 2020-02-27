FactoryBot.define do
  factory :user do
    name     { Faker::Name.name   }
    password { '12345678' }
  end
end