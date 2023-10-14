class Information < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  has_one_attached :photo
end
