class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :cards
  has_one :address
  accepts_nested_attributes_for :address
  has_many :images

  validates :nickname, presence: true
end
