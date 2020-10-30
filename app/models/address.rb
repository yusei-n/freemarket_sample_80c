class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postal_prefectures
  belongs_to :user, optional: true

  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください" }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください" }
  validates :last_name_hurigana, presence: true,
                                 format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_hurigana, presence: true,
                                  format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true
  validates :postal_number, presence: true
  validates :postal_prefectures_id, presence: true
  validates :postal_municipalities, presence: true
  validates :postal_address, presence: true
end
