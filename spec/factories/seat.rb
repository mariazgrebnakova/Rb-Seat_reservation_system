FactoryBot.define do
  factory :seat, class: Seat do
    association :department, factory: [:department]

    name { 'ACC001' }
    coordinates { '842,123,698,456' }
    shape { 'rect' }

    trait Seat.all.each do |k|
      shape {k['shape']}
    end

    trait Department.all.each do |k|
      name {"#{k['code']}#{1..100}" }
    end

    trait Seat.all.each do |x|
      coordinates { "#{1...1000}, #{1...1000}, #{1...1000}, #{1...1000}" }
    end
  end
end