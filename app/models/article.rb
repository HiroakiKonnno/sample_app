class Article < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :user
  validates :title, length: { maximum: 10 }
  validates :title, presence: true
  validates :content, presence: true
end
