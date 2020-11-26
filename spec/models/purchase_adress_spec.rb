require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  # before do
  #   @purchase_address = FactoryBot.build(:purchase_address)
  # end

  # describe '購入情報の保存' do
  #   context '商品を購入できるとき' do
  #     it 'すべての値が正しく入力されていれば保存できること' do
  #       expect(@purchase_address).to be_valid
  #     end
  #     it 'building_nameは空でも保存できること' do
  #       @purchase_address.building_name = nil
  #       expect(@purchase_address).to be_valid
  #     end
  #   end

  #   context '商品を購入できないとき' do
  #     it 'post_codeが空では保存できないこと' do
  #       @purchase_address.postal_code = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
  #     end

  #     it 'post_codeに-が入ってないと保存できないこと' do
  #       @purchase_address.postal_code = "1234567"
  #       @purchase_address.valid?
  #       expect(@opurchase_address.errors.full_messages).to include("Post code is invalid")
  #     end

  #     it 'ship_from_idが空では保存できないこと' do
  #       @purchase_address.ship_from_id = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Ship from id can't be blank")
  #     end

  #     it 'ship_from_idの値が0では保存できないこと' do
  #       @purchase_address.postal_code = 0
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Ship from id is invalid")
  #     end

  #     it 'cityが空では保存できないこと' do
  #       @purchase_address.city = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("City can't be blank")
  #     end

  #     it 'house_numberが空では保存できないこと' do
  #       @purchase_address.address = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("House_number can't be blank")
  #     end

  #     it 'phone_numberが空では保存できないこと' do
  #       @purchase_address.phone_number = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
  #     end

  #     it 'phone_numberに-があると保存できないこと' do
  #       @purchase_address.phone_number = "123-456-789"
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
  #     end

  #     it 'phone_numberが12文字以上では保存できないこと' do
  #       @purchase_address.phone_number = '123456789098'
  #       @purchase_address.valid?
  #       except(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  #     end

  #     it 'tokenが空では登録できないこと' do
  #       @purchase_address.phone_number = nil
  #       @purchase_address.valid?
  #       expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
  #     end
  #   end
  # end
end
