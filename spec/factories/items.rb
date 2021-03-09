FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    describe                 { Faker::Lorem.sentence }
    category_id              { Faker::Number.within(range: 2..11) }
    status_id { Faker::Number.within(range: 2..7) }
    shipping_charge_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    days_to_ship_id { Faker::Number.within(range: 2..4) }
    price       { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
