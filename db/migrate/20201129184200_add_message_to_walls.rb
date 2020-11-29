class AddMessageToWalls < ActiveRecord::Migration[6.0]
  def change
  	add_column :walls, :message, :string
  end
end
