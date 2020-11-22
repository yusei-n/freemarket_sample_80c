require 'rails_helper'

describe Product do
  describe '#create' do
    it "必須事項すべて存在していると登録できる"do
      product = build(:product)
      expect(product).to be_valid
    end
    it "タイトルが空だと登録できない" do
      product = build(:product, title: "")
      product.valid?
      expect(product.errors[:title]).to include("を入力してください")
    end
    it "タイトルが40文字以上だと登録できない" do
      product = build(:product, title: "a" * 41)
      product.valid?
      expect(product.errors[:title]).to include("は40文字以内で入力してください")
    end
    it "タイトルが40文字だと登録できる" do
      product = build(:product, title: "a" * 40)
      expect(product).to be_valid
    end
    it "説明文が空だと登録できない" do
      product = build(:product, explanation: "")
      product.valid?
      expect(product.errors[:explanation]).to include("を入力してください")
    end
    it "説明文が1000文字以上だと登録できない" do
      product = build(:product, explanation: "a" * 1001)
      product.valid?
      expect(product.errors[:explanation]).to include("は1000文字以内で入力してください")
    end
    it "説明文が1000文字だと登録できる" do
      product = build(:product, explanation: "a" * 1000)
      expect(product).to be_valid
    end
    it "金額が空だと登録できない" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください", "は一覧にありません")
    end
    it "金額が300以下だと登録できない" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は一覧にありません")
    end
    it "金額が300だと登録できる" do
      product = build(:product, price: 300)
      expect(product).to be_valid
    end
    it "金額が99999999以上だと登録できない" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は一覧にありません")
    end
    it "金額が9999999だと登録できる" do
      product = build(:product, price: 9999999)
      expect(product).to be_valid
    end
    it "送料の負担が空だと登録できない" do
      product = build(:product, delivery_burden_id: "")
      product.valid?
      expect(product.errors[:delivery_burden_id]).to include("を選択してください")
    end
    it "商品の状態が空だと登録できない" do
      product = build(:product, product_status_id: "")
      product.valid?
      expect(product.errors[:product_status_id]).to include("を選択してください")
    end
    it "発送までの日時が空だと登録できない" do
      product = build(:product, estimated_shipping_id: "")
      product.valid?
      expect(product.errors[:estimated_shipping_id]).to include("を選択してください")
    end
    it "カテゴリーが空だと登録できない" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include()
    end
    it "配送元地位が空だと登録できない" do
      product = build(:product, postal_prefectures_id: "")
      product.valid?
      expect(product.errors[:postal_prefectures_id]).to include("を選択してください")
    end
    it "ブランドが空でも登録できる" do
      product = build(:product, brand: "")
      expect(product).to be_valid
    end
    it "画像がないと登録できない" do
      product = build(:image, image: "")
      product.valid?
    expect(product.errors[:image]).to include("を1枚以上登録してください")
    end
  end


  describe '#update' do
    it "変更可能な項目があれば登録できる" do
      product = build(:product)
      expect(product).to be_valid
    end
    it "タイトルが空だと登録できない" do
      product = build(:product, title: "")
      product.valid?
      expect(product.errors[:title]).to include("を入力してください")
    end
    it "金額が空だと登録できない" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください", "は一覧にありません")
    end
    it "説明文が空だと登録できない" do
      product = build(:product, explanation: "")
      product.valid?
      expect(product.errors[:explanation]).to include("を入力してください")
    end
    it "画像がないと登録できない" do
      product = build(:image, image: nil)
      product.valid?
      expect(product.errors[:image]).to include("を1枚以上登録してください")
    end
  end
end