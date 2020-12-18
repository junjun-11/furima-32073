require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '購入情報の保存' do
    context '購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = 1_234_567
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefectureが空だと保存できないこと' do
        @user_purchase.prefecture_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @user_purchase.prefecture_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it 'municipalityは空では保存できないこと' do
        @user_purchase.municipality = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberは空では保存できないこと' do
        @user_purchase.house_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @user_purchase.phone_number = '１１１１１１１１１１１'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number Input only number')
      end

      it 'tokenが空では保存できないこと' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
