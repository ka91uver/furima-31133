FactoryBot.define do
  factory :purchase_adress do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { 港区 }
    house_number { 六本木 }
    building_name { 六本木ユニハウス }
    phone_number { 12345678900 }
  end
end
