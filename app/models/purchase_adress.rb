class PurchaseAdress < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  class PurchaseAdress
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token
  
    with_options presence: true do
      validates :post_code, format:{with: /\A\d{3}[-]\d{4}\z/ }
      validates :prefecture_id, numericality: { other_than: 0 }
      validates :city
      validates :house_number
      validates :building_name
      validates :phone_number, format:{with:/\A[0-9]+\z/}, length: {maximum: 11}
      validates :token
    end
  
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Adress.create( post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    end
  end  
end
