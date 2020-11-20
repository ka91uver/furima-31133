class PurchaseAdress < ApplicationRecord
  class PurchaseAdress
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token
  
    with_options presence: true do
      validates :post_code, format:{with:/\A\d{3}[-]\d{4}\z/}
      validates :prefecture_id
      validates :city
      validates :house_number
      validates :building_name
      validates :phone_number, format:{with:/\A[0-9]+\z/}
      validates :token
    end
      validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Adress.create( post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    end
  end  
end
