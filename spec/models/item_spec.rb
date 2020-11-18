require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品登録が上手くいくとき' do
      it 'item_name、item_description、category_id、condition_id、shipping_fee_id、ship_from_id、days_until_shipping_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録が上手くいかないとき' do
      it 'item_nameが空だと登録できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空だと登録できない' do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idが1以下だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが1以下だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipping_fee_idが1以下だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it 'ship_from_idが1以下だと登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from must be other than 1")
      end
      it 'days_until_shipping_idが1以下だと登録できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
      end

      it 'priceが¥300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥9,999,999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = ' ５００ '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
