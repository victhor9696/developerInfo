class VideoAvaliable < ActiveRecord::Base
  validate :video_id
end
