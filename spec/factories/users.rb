FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_kananame        {'タナカ'}
    first_kananame       {'タロウ'}
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }

  end
end