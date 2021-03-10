FactoryBot.define do
  factory :order_form_object do

    postal_code { '123-1234' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    municipality {Gimei.city.kanji}
    address {Gimei.town.kanji}
    building {Gimei.town.katakana}
    tel_num {Faker::Number.number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
