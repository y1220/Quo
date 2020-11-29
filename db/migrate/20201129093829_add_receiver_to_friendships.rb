class AddReceiverToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships, :receiver, foreign_key: { to_table: :users }
  end
end
