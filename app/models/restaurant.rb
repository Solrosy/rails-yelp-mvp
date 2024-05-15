class Restaurant < ApplicationRecord
  CATEGORIES = %w(chinese italian japanese french belgian)
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  def average_rating
    if reviews.any?
      reviews.average(:rating).to_i.round(1)
    else
      "no reviews"
    end
  end
end
