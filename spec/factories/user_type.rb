FactoryBot.define do
  factory :user_type, class: UserType do
    name { 'User' }

    trait :name do
      name {'Administrator'}
    end

    trait :name do
      name {'Host'}
    end

    trait :name do
      name {'Manager'}
    end
  end
end
