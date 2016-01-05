class NewsTags < ActiveRecord::Base
  validates :tag_id, presence: true
  validates :news_id, presence: true
  belongs_to :tags
  belongs_to :news
end
