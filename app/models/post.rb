class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :guide
  has_one_attached :image
end
