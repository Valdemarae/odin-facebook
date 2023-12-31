class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :add_default_photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  private
  
  def add_default_photo
    UserMailer.with(user: User.last).welcome_email.deliver_later
    self.create_information!(description: '...')
    self.information.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
  end
end
