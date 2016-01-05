class HomeController < ApplicationController
  def index
    @news = News.select(:title_br,:title_es,:description_br,:description_es,:slug).where(status: 1).limit(10)
    @videos = Video.select(:title_br,:title_es,:description_br,:description_es,:slug).where(status: 1).limit(10)
  end
end
