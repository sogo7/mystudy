class Post < ApplicationRecord
  validates :meigen, presence: true
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

  def user
    return User.find_by(id: self.user_id)
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
