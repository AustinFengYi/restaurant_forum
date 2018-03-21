class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :name
  belongs_to :category , optional: true
end