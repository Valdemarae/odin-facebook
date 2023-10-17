class Post < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :comments

  has_many :likes

  validates :content, presence: true

  has_one_attached :image
end
