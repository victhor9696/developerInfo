class AddColumnVideoTags < ActiveRecord::Migration
  def change
    add_column :tags_videos, :locale_id, :integer
  end
end
