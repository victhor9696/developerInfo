class NewsController < ApplicationController
  def show
    @news = News.friendly.find(params[:slug])
    @voted_count = NewsAvaliable.where(news_id: @news.id).count
    @avg = NewsAvaliable.where(news_id: @news.id).average(:score).to_i
    @already_voted = already_voted? @news.id
    @comments_news = CommentNews.fetch_all_comments @news.id
  end

  def avaliable
    return_state = false;
    if already_voted? params[:news_id]
      NewsAvaliable.create(user_id: session[:id],news_id: params[:news_id],score: params[:score])
      return_state = true
    end
    render :json => {:status => return_state}
  end

  def already_voted? news_id
    if logged?
      if NewsAvaliable.where(user_id: session[:id],news_id: news_id).first.nil?
        return true
      end
      return false
    end
    return false;
  end

  def search
    @news = News.search params[:query]
  end

end
