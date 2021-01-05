class User < ApplicationRecord
  has_secure_password validations: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
end
