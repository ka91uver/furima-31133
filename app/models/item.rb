class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :days_until_shipping
  
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price, numericality: {only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
    validates :image
  end
  
  validates :category, :condition, :shipping_fee, :ship_from, :days_until_shipping, numericality: { other_than: 1 }
end
