class CommentNews < ActiveRecord::Base
  validates :message, presence: true
  validates :news_id, presence: true
  validates :user_id, presence: true

  belongs_to :news
  belongs_to :user

  def self.list status
    title = "news.title_es"
    if I18n.locale == :"pt-BR"
      title = "news.title_br"
    end
    CommentNews.select("users.email, comment_news.id, comment_news.news_id, comment_news.message,comment_news.status ,"+title)
    .joins(:user,:news).where("comment_news.status <> 1").order("comment_news.created_at DESC")
  end

  def which_state
    if self.status == 1
      return I18n.t('form.statusTrue')
    else
     return I18n.t('form.statusFalse')
    end
  end

  def self.fetch_all_comments id
    title = "news.title_es"
    if I18n.locale == :"pt-BR"
      title = "news.title_br"
    end
    CommentNews.select("users.email, comment_news.id, comment_news.news_id, comment_news.message,comment_news.status ,"+title)
    .joins(:user,:news).where("comment_news.status = 1 and comment_news.news_id = "+id.to_s).order("comment_news.created_at DESC")
  end

end
