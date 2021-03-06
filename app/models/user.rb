class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end
  
 # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants ,through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants,through: :favorites,source: :restaurant
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants,through: :likes,source: :restaurant
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
end
