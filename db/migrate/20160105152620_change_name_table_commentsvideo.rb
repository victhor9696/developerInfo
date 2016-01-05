class ChangeNameTableCommentsvideo < ActiveRecord::Migration
  def change
    drop_table :comment_videos
    create_table :comments_videos do |t|
      t.string :message
      t.integer :video_id
      t.timestamps :date_register
      t.integer :status
      t.integer :locale_id
      t.integer :user_id
    end
  end
end
