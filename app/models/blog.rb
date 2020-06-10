class Blog < ApplicationRecord

  validates :content, presence: true
  validates :content, length: { in: 1..140 }
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
