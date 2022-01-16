  FactoryBot.define do
    factory :user, class: User do
      association :department, factory: [:department]
      association :user_type, factory: [:user_type]
  
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      is_admin { false }
      password { 'password' }
      password_confirmation { 'password' }
  
      trait :admin do
        is_admin { true }
      end
      
    end
  end
