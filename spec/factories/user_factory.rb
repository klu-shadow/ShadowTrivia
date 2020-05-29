FactoryBot.define do
  
  factory :user do
    email           { Faker::Internet.email }
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    password        { 'PotatoTomato26!' }
  end

  factory :admin do
    role { 'admin' }
  end
  
end