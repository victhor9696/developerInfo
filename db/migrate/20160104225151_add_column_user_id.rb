class AddColumnUserId < ActiveRecord::Migration
  def change
    add_column :comments_news, :user_id, :integer
  end
end
