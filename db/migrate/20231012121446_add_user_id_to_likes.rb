class AddUserIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, index: true
  end
end
