require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it '郵便番号・都道府県・市区町村・番地・建物名・電話番号が存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号がなければ購入できない' do
        @order.postal_code = ''
        @order.valid?
        binding.pry
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県がなければ購入できない' do
      end
      it '市区町村がなければ購入できない' do
      end
      it '番地がなければ購入できない' do
      end
      it '電話番号がなければ購入できない' do
      end
      it '郵便番号にハイフンがなければ購入できない' do
      end
      it '電話番号が12桁以上では購入できない' do
      end
    end
  end
end
