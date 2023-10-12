class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships

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
end
