class CommentVideo < ActiveRecord::Base
  validates :message, presence: true
  validates :video_id, presence: true
  validates :user_id, presence: true

  belongs_to :video
  belongs_to :user

  def self.list status
    title = "videos.title_es"
    if I18n.locale == :"pt-BR"
      title = "videos.title_br"
    end
    CommentVideo.select("users.email, comment_videos.id, comment_videos.video_id, comment_videos.message,comment_videos.status ,"+title)
    .joins(:user,:video).where("comment_videos.status <> 1").order("comment_videos.created_at DESC")
  end

  def which_state
    if self.status == 1
      return I18n.t('form.statusTrue')
    else
     return I18n.t('form.statusFalse')
    end
  end

  def self.fetch_all_comments id
    title = "videos.title_es"
    if I18n.locale == :"pt-BR"
      title = "videos.title_br"
    end
    CommentVideo.select("users.email, comment_videos.id, comment_videos.video_id, comment_videos.message,comment_videos.status ,"+title)
    .joins(:user,:video).where("comment_videos.status = 1 and comment_videos.video_id = "+id.to_s).order("comment_videos.created_at DESC")
  end
end
