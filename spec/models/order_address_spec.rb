require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必須項目の入力があれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameの入力が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角数値とhyphen(-)で入力されなければ商品は購入できない' do
        @order_address.postal_code = '０００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'area_idが空では購入できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1{---}では購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では購入できない' do
        @order_address.phone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが半角数値で入力されなければ商品は購入できない' do
        @order_address.phone_number = '０００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'phone_numberが半角数値のみで入力されなければ商品は購入できない' do
        @order_address.phone_number = '000-0000-0000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "tokenが空では購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end