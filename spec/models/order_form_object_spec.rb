require 'rails_helper'

RSpec.describe OrderFormObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form_object = FactoryBot.build(:order_form_object, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it '郵便番号・都道府県・市区町村・番地・建物名・電話番号・トークンが存在すれば購入できる' do
        expect(@order_form_object).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_form_object.building = ''
        expect(@order_form_object).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号がなければ購入できない' do
        @order_form_object.postal_code = ''
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県がなければ購入できない' do
        @order_form_object.prefecture_id = 1
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村がなければ購入できない' do
        @order_form_object.municipality = ''
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がなければ購入できない' do
        @order_form_object.address = ''
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がなければ購入できない' do
        @order_form_object.tel_num = ''
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Tel num can't be blank")
      end
      it '郵便番号にハイフンがなければ購入できない' do
        @order_form_object.postal_code = '1234567'
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include('Postal code Input correctly')
      end
      it '電話番号が半角数字以外では購入できない' do
        @order_form_object.tel_num = 'あああ'
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include('Tel num Input only number')
      end
      it '電話番号は11桁以内でないと購入できない' do
        @order_form_object.tel_num = '123456789012'
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include('Tel num Input only number')
      end
      it 'トークンが空では購入できない' do
        @order_form_object.token = nil
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @order_form_object.user_id = nil
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_form_object.item_id = nil
        @order_form_object.valid?
        expect(@order_form_object.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
