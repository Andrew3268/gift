class Shop < ApplicationRecord
  belongs_to :user
  has_one_attached :shop_image
end
