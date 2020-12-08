require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
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
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）、値の一致しないと登録できない' do
        @user.password_confirmation = '11111b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字が空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名は、名前が空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'ユーザー本名のフリガナは、名字が空だと登録できない' do
        @user.furigana_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が空だと登録できない' do
        @user.furigana_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first can't be blank")
      end
      it 'ユーザー本名の名字フリガナは、全角（カタカナ）で入力しないと登録できない' do
        @user.furigana_last = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana last Full-width katakana characters')
      end
      it 'ユーザー本名の名前フリガナは、全角（カタカナ）で入力しないと登録できない' do
        @user.furigana_first = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana first Full-width katakana characters')
      end
      it '生年月日が空だと登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
