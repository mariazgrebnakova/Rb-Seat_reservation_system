FactoryBot.define do
  factory :reservation, class: Reservation do
    association :seat, factory: [:seat]
    association :user, factory: [:user]

    from { Faker::Date.between(from: '2022-01-01', to: '2022-01-30') }
    to { Faker::Date.between(from: '2022-01-30', to: '2022-02-25') }
  end
end