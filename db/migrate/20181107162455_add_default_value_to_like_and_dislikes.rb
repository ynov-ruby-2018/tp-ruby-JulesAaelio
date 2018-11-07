class AddDefaultValueToLikeAndDislikes < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :likes, :integer, default: 0
    change_column :messages, :dislikes, :integer, default: 0
  end
end
