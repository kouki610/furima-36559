FactoryBot.define do
  factory :order_address do
    postal_code       { "123-4567" }
    area_id           { 2 }
    municipalities    { "テスト市" }
    address           { "テスト1-2-3" }
    building_name     { "テストビル" }
    phone_number      { "00000000000" }
    token             {"tok_abcdefghijk00000000000000000"}
  end
end