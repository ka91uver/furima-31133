require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end
  
    describe '購入情報の保存' do
      context '商品を購入できるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@item_purchase).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @item_purchase.building_name = nil
          expect(@item_purchase).to be_valid
        end
      end
  
      context '商品を購入できないとき' do
        it 'post_codeが空では保存できないこと' do
          @item_purchase.postal_code = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Post code can't be blank")
        end
  
        it 'post_codeに-が入ってないと保存できないこと' do
          @item_purchase.postal_code = "1234567"
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Post code is invalid")
        end
  
        it 'ship_from_idが空では保存できないこと' do
          @item_purchase.ship_from_id = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Ship from id can't be blank")
        end
  
        it 'ship_from_idの値が0では保存できないこと' do
          @item_purchase.postal_code = 0
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Ship from id is invalid")
        end
  
        it 'cityが空では保存できないこと' do
          @item_purchase.city = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("City can't be blank")
        end
  
        it 'house_numberが空では保存できないこと' do
          @item_purchase.address = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("House_number can't be blank")
        end
  
        it 'phone_numberが空では保存できないこと' do
          @item_purchase.phone_number = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
        end
  
        it 'phone_numberに-があると保存できないこと' do
          @item_purchase.phone_number = "123-456-789"
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
        end
  
        it 'phone_numberが12文字以上では保存できないこと' do
          @item_purchase.phone_number = '123456789098'
          @item_purchase.valid?
          except(@item_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end
  
        it 'tokenが空では登録できないこと' do
          @item_purchase.phone_number = nil
          @item_purchase.valid?
          expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
  
end
