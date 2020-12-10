require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像が空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空だと保存できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'カテゴリーの情報が選択されていないと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態についての情報が空だと保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '商品の状態についての情報が選択されていないと保存できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '配送料の負担についての情報が空だと保存できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it '配送料の負担についての情報が選択されていないと保存できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it '発送元の地域についての情報が空だと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送元の地域についての情報が選択されていないと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数についての情報が空だと保存できない' do
        @item.day_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship Select')
      end
      it '発送までの日数についての情報が選択されていないと保存できない' do
        @item.day_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship Select')
      end
      it '価格についての情報が空だと保存できない' do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと保存できない(下限)' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price Out of setting range')
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと保存できない(上限)' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price Out of setting range')
      end
      it '販売価格は半角数字のみで入力しないと保存できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price Half-width number')
      end
    end
  end
end
