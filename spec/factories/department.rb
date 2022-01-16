  FactoryBot.define do
    factory :department, class: Department do
      code { Faker::Company.czech_organisation_number }
      name { Faker::Company.name }
    end
  end