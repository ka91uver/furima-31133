class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item, dependent: :destroy
  has_one :address, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_from
end
