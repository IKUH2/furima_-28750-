require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録出来ること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '既に登録されたメールアドレスが存在する場合、登録出来ないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end

    it 'passwordが空だと登録出来ないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'passwordが半角英語だけだと登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角7~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります'
    end

    it 'passwordが半角数字だけだと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角7~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります'
    end

    it 'password_confirmationが空だと登録出来ないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空だと登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'last_nameが半角だと登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name は全角で入力してください'
    end

    it 'first_nameが半角だと登録できないこと' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name は全角で入力してください'
    end

    it 'last_name_kanaが空だと登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'last_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana は全角カタカナで入力して下さい'
    end

    it 'first_name_kanaが全角カタカナ以外だと登録できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana は全角カタカナで入力して下さい'
    end

    it 'birthdayが空だと登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include 'Birth date は西暦から数字８桁で入力して下さい'
    end

    it 'Emailに@がないと登録できない' do
      @user.email = 'testemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
  end
end
