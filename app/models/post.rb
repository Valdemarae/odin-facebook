class Post < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :comments

  has_many :likes

  validated :content, presence: true
end
