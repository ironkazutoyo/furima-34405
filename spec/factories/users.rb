FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    last_name_kana        {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birthday              {'1990/12/17'}
  end
end