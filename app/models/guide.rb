class Guide < ApplicationRecord
  belongs_to :user
  has_one_attached :guide_image
end
