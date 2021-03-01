require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'
  context '新規登録できるとき' do
    it 'ニックネーム・メールアドレス・パスワード・パスワード(確認)・氏名・氏名(カナ)・生年月日が存在すれば登録できる。' do
      expect(@user).to be_valid
    end
    it 'パスワード・パスワード(確認)が英数字混合6文字以上であれば登録できる' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが存在しても、パスワード(確認)が空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'メールアドレスが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@が存在しなければ登録できない' do
      @user.email = 'aaabbb.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワード・パスワード(確認)が半角英字のみの入力では登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワード・パスワード(確認)が半角数字のみの入力では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワードとパスワード(確認)の値が一致していなければ登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = 'b12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameがアルファベットでの入力では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'last_nameが数字での入力では登録できない' do
      @user.last_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'first_nameがアルファベットでの入力では登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'first_nameが数字での入力では登録できない' do
      @user.first_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'last_name_kanaは漢字での入力では登録できない' do
      @user.last_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'last_name_kanaはひらがなでの入力では登録できない' do
      @user.last_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'last_name_kanaはアルファベットでの入力では登録できない' do
      @user.last_name_kana = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'last_name_kanaは数字での入力では登録できない' do
      @user.last_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'first_name_kanaは漢字での入力では登録できない' do
      @user.first_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaはひらがなでの入力では登録できない' do
      @user.first_name_kana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaはアルファベットでの入力では登録できない' do
      @user.first_name_kana = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'first_name_kanaは数字での入力では登録できない' do
      @user.first_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
  end
end
