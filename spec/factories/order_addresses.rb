FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '111-1111' }
    prefecture_id { 1 }
    municipality { '横浜市' }
    address { '青山1-1' }
    building_name { 'ビル103'}
    phone_number { 12345678910 }
  end
end
