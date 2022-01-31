FactoryBot.define do
  factory :user_type, class: UserType do
    initialize_with { UserType.find_or_initialize_by(name: name) }
    name { 'User' }

    trait UserType.all.each do |k|
      name {k['name']}
    end

  end
end
