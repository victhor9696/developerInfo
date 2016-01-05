class TagsVideos < ActiveRecord::Base
  validates :tag_id, presence: true
  validates :video_id, presence: true

  belongs_to :videos
  belongs_to :tags
end
