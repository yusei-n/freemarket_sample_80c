class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true
  validates :image, presence: true,length: {minimum: 1, maximum: 5}
end
