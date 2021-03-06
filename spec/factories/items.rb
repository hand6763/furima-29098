FactoryBot.define do
  factory :item do
    name              { 'ああ' }
    explanation       { 'いい' }
    category_id       { 2 }
    status_id         { 2 }
    deliver_fee_id    { 2 }
    prefecture_id { 2 }
    shipping_day_id   { 2 }
    price             { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/cat-5605615_1920.jpg'), filename: 'cat-5605615_1920.jpg')
    end
  end
end
