FactoryBot.define do
  factory :user_type, class: UserType do
    name { 'User' }

    trait UserType.all.each do |k|
      name {k['name']}
    end

  end
end
