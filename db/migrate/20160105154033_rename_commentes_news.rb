class RenameCommentesNews < ActiveRecord::Migration
  def change
    rename_table :comments_news, :comment_news
  end
end
