FactoryBot.define do
  factory :order do
    postal_code { 123 - 1234 }
    prefecture_id { Faker::Number.within(range: 2..48) }
    municipality { Gimei.city.kanji }
    address { Gimei.town.kanji }
    building { Gimei.town.katakana }
    tel_num { Faker::Number.number(digits: 11) }
    association :order_history
  end
end
