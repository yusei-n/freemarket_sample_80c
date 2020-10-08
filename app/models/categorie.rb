class Categorie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categorie
  has_many :producrs
end
