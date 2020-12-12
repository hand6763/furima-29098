require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品出品がうまくいくとき' do
      it 'imageとname,explanation,category_id,status_id,deliver_id,shipping_area_id,shippng_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'categoryが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'statusが選択されていないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it 'deliver_feeが選択されていないと登録できない' do
        @item.deliver_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver fee Select")
      end
      it 'shipping_areaが選択されていないと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
      end
      it 'shipping_dayが選択されていないと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day Select")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300~9999999以外だと登録できない' do
        @item.price = [100]
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end

