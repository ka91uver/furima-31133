class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :shipping_fee_id
  belongs_to_active_hash :ship_from_id
  belongs_to_active_hash :days_until_shipping_id
  # belongs_to :price

  validates :content, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :days_until_shipping_id, numericality: { other_than: 1 }
end
