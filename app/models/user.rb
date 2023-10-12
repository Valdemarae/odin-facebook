class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_information

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships

  has_many :posts, foreign_key: 'creator_id'

  has_many :comments, foreign_key: 'creator_id', through: :posts

  has_many :likes

  has_one :information

  validates :name, presence: true

  def friends
    ids1 = Friendship.where(user_id: id, confirmed: true).pluck(:another_user_id)
    ids2 = Friendship.where(another_user_id: id, confirmed: true).pluck(:user_id)
    ids = ids1 + ids2
    User.where(id: ids)
  end

  def sent_invitations
    ids = friendships.where(confirmed: false).pluck(:another_user_id)
    User.where(id: ids)
  end

  def received_invitations
    ids = Friendship.where(another_user_id: id, confirmed: false).pluck(:user_id)
    User.where(id: ids)
  end

  private

  def create_information
    User.last.create_information!(photo: 'https://i.stack.imgur.com/YaL3s.jpg', description: '...')
  end
end
