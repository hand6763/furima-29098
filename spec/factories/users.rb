FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    sei                   {"ああ"}
    mei                   {"いい"}
    sei_kana              {"アア"}
    mei_kana              {"イイ"}
    birthday              {"1930-05-20"}

  end
end