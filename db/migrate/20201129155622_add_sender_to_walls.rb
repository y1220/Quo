class AddSenderToWalls < ActiveRecord::Migration[6.0]
  def change
  	add_reference :walls, :sender, foreign_key: { to_table: :users }
  end
end
