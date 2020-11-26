FactoryBot.define do
  factory :item_purchase do
    token         { 'tok_abcdefghijk00000000000000000' }
    post_code     { '123-4567' }
    ship_from_id  { 14 }
    city          { '東京' }
    house_number  { '1-1' }
    building_name { 'あいうえおビル' }
    phone_number  { 12345678909 }
  end
end
