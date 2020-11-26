FactoryBot.define do
  factory :item_purchase do
    token         { 'tok_abcdefghijk00000000000000000' }
    post_code     { '123-4567' }
    ship_from_id  { '2' }
    city          { 'あ市' }
    house_number  { '1-1' }
    building_name { 'あいうえおビル' }
    phone_number  { '09011112222' }
  end
end
