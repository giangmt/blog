class Article < ApplicationRecord
  has_many :comments

  scope :desc, -> {order "created_at DESC"}
end
