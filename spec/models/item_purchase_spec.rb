require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_purchase = FactoryBot.build(:item_purchase, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '購入情報の保存' do
    context '商品を購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@item_purchase).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @item_purchase.building_name = nil
        expect(@item_purchase).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'post_codeが空では購入できないこと' do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it 'post_codeに-が入ってないと購入できないこと' do
        @item_purchase.post_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeが全角では購入できないこと' do
        @item_purchase.post_code = '123-４５６７'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code is invalid")
      end

      it 'ship_from_idの値が1では購入できないこと' do
        @item_purchase.ship_from_id = 0
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Ship from must be other than 1")
      end

      it 'cityが空では購入できないこと' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できないこと' do
        @item_purchase.house_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できないこと' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに-があると購入できないこと' do
        @item_purchase.phone_number = '123-4567-8909'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12文字以上では購入できないこと' do
        @item_purchase.phone_number = '123456789098'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'tokenが空では購入できないこと' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では購入できないこと' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @item_purchase.item_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
