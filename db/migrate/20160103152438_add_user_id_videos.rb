class AddUserIdVideos < ActiveRecord::Migration
  def change
    add_column :videos, :user_id, :integer
  end
end
