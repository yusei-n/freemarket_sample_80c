require 'rails_helper'

describe Address do
  describe '#create' do
    # 1. last_name, first_name, last_name_hurigana, first_name_hurigana, birthday, postal_number, postal_municipalities, postal_addressが存在すれば登録できること
    it "is valid with a last_name, first_name, last_name_hurigana, first_name_hurigana, birthday, postal_number, postal_municipalities, postal_address" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    # 3. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    # 4. last_name_huriganaが空では登録できないこと
    it "is invalid without a last_name_hurigana" do
      address = build(:address, last_name_hurigana: nil)
      address.valid?
      expect(address.errors[:last_name_hurigana]).to include("を入力してください")
    end

    # 5. first_name_huriganaが空では登録できないこと
    it "is invalid without a first_name_hurigana" do
      address = build(:address, first_name_hurigana: nil)
      address.valid?
      expect(address.errors[:first_name_hurigana]).to include("を入力してください")
    end

    # 6. birthdayが空では登録できないこと
    it "is invalid without a birthday" do
      address = build(:address, birthday: nil)
      address.valid?
      expect(address.errors[:birthday]).to include("を入力してください")
    end

    # 7. postal_numberが空では登録できないこと
    it "is invalid without a postal_number" do
      address = build(:address, postal_number: nil)
      address.valid?
      expect(address.errors[:postal_number]).to include("を入力してください")
    end

    # 8. postal_municipalitiesが空では登録できないこと
    it "is invalid without a postal_municipalities" do
      address = build(:address, postal_municipalities: nil)
      address.valid?
      expect(address.errors[:postal_municipalities]).to include("を入力してください")
    end
    
    # 9. postal_addressが空では登録できないこと
    it "is invalid without a postal_address" do
      address = build(:address, postal_address: nil)
      address.valid?
      expect(address.errors[:postal_address]).to include("を入力してください")
    end

    # 10. postal_prefectures_idが空では登録できないこと
    it "is invalid without a postal_prefectures_id" do
      address = build(:address, postal_prefectures_id: nil)
      address.valid?
      expect(address.errors[:postal_prefectures_id]).to include("を入力してください")
    end

  end
end