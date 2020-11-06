class Category < ApplicationRecord
  has_many :producrs
  has_ancestry
end
