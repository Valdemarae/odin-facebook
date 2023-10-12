class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.integer :another_user_id
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
