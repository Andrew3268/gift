class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :guide
  belongs_to :shop
  has_one_attached :image

  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term", 
    search_term: "%#{search_term.downcase}%")
  end
end
