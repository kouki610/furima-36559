require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録成功時'do
      it '全ての入力が問題なく存在する' do
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailsに@が含まれていないと登録できない' do
        @user.email = 'abcd.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationの値が一致しないため登録できない' do
        @user.password = 'test11'
        @user.password_confirmation = 'test22'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが英字のみでは登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが英字のみでは登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_kananameが空では登録できない' do
        @user.last_kananame = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kananame can't be blank")
      end

      it 'last_kananameはひらがなでは登録できない' do
        @user.last_kananame = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kananame is invalid')
      end

      it 'last_kananameは英字のみでは登録できない' do
        @user.last_kananame = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kananame is invalid')
      end

      it 'first_kananameが空では登録できない' do
        @user.first_kananame = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kananame can't be blank")
      end

      it 'first_kananameはひらがなでは登録できない' do
        @user.first_kananame = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kananame is invalid')
      end

      it 'first_kananameは英字のみでは登録できない' do
        @user.first_kananame = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kananame is invalid')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end