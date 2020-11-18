FactoryBot.define do
  factory :item do
    item_name              { Faker::Name.name }
    item_description       { Faker::Lorem.sentence }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_fee_id        { 2 }
    ship_from_id           { 2 }
    days_until_shipping_id { 2 }
    price                  { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
