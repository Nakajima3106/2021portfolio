class Post < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :image, presence: true
  validates :explanation, presence: true
  validates :impressions, presence: true



  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
