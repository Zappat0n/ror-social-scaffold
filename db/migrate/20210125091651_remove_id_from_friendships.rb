class RemoveIdFromFriendships < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :id
  end
end
