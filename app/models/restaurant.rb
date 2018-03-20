class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :name
  
end