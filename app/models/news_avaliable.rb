class NewsAvaliable < ActiveRecord::Base
  belongs_to :news
  belongs_to :user
end
