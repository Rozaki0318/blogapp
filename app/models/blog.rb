class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :text, presence: true
  mount_uploader :image, ImageUploader

end
