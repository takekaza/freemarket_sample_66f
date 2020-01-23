require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    it "商品名の空バリデーション" do
      item = build(:item,name:"")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "価格の空バリデーション" do
      item = build(:item,price:"")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "説明文の空バリデーション" do
      item = build(:item,text:"")
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "商品状態の空バリデーション" do
      item = build(:item,condition:"")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end
    it "発送方法の空バリデーション" do
      item = build(:item,way:"")
      item.valid?
      expect(item.errors[:way]).to include("can't be blank")
    end
    it "発送日数の空バリデーション" do
      item = build(:item,date:"")
      item.valid?
      expect(item.errors[:date]).to include("can't be blank")
    end
    it "送料負担者の空バリデーション" do
      item = build(:item,berser:"")
      item.valid?
      expect(item.errors[:berser]).to include("can't be blank")
    end
    it "発送元の空バリデーション" do
      item = build(:item,region:"")
      item.valid?
      expect(item.errors[:region]).to include("can't be blank")
    end




describe Item do
  describe '#index' do
    it "should get index" do
    end
  end
end