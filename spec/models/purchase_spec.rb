require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'numberとexp_month、exp_year、cvc, post_code, prefecture_id、city、house_number、building_name、telephoneが存在すれば登録出来ること' do
      expect(@purchase_address).to be_valid
    end

    it 'クレジットカード情報は必須で、正しいカード情報が入力されていないと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Post code can't be blank"
    end

    it '都道府県1が選択された場合、保存ができないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Prefecture Select'
    end

    it '市区町村が空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空だと保存できないこと' do
      @purchase_address.house_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
    end

    it '電話番号が空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @purchase_address.post_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Post code Input correctly'
    end

    it '電話番号にハイフンがあると登録できないこと' do
      @purchase_address.phone_number = '090-0000-0000'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include 'Phone number is invalid'
    end

    it '建物名が空でも登録できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end
end
