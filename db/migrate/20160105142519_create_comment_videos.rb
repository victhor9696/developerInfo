class CreateCommentVideos < ActiveRecord::Migration
  def change
    create_table :comment_videos do |t|
      t.string :message
      t.integer :video_id
      t.timestamps :date_register
      t.integer :status
      t.integer :locale_id
      t.integer :user_id
    end
  end
end
