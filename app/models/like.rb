class Like < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants,through: :favorites,source: :restaurant

end
