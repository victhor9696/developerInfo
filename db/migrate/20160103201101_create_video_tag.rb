class CreateVideoTag < ActiveRecord::Migration
  def change
    create_table :tags_videos do |t|
      t.integer   :video_id
      t.integer   :tag_id
    end
  end
end
