require 'rails_helper'

RSpec.describe PurchaseAdress, type: :model do
  before do
    @purchase_adress = FactoryBot.build(:purchase_adress)
  end

  describe '購入情報の保存' do
    context '商品を購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_adress).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_adress.building_name = nil
        expect(@purchase_adress).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'post_codeが空では保存できないこと' do
        @purchase_adress.postal_code = nil
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeに-が入ってないと保存できないこと' do
        @purchase_adress.postal_code = "1234567"
        @purchase_adress.valid?
        expect(@opurchase_adress.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idが空では保存できないこと' do
        @purchase_adress.prefecture_id = nil
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("Prefecture id can't be blank")
      end

      it 'prefecture_idの値が0では保存できないこと' do
        @purchase_adress.postal_code = 0
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("Prefecture id is invalid")
      end

      it 'cityが空では保存できないこと' do
        @purchase_adress.city = nil
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存できないこと' do
        @purchase_adress.address = nil
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("House_number can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @purchase_adress.phone_number = nil
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberに-があると保存できないこと' do
        @purchase_adress.phone_number = "123-456-789"
        @purchase_adress.valid?
        expect(@purchase_adress.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12文字以上では保存できないこと' do
        @purchase_adress.phone_number = '123456789098'
        @purchase_adress.valid?
        except(@purchase_adress.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
