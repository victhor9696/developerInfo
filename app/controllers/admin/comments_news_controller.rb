class Admin::CommentsNewsController < ApplicationController
  layout "admin"
  before_filter :logged_or_redirect
  def index
    @comments_news = CommentNews.list "0"
  end

  def valid
    if params[:flag] == "0"
      params[:select].each do |sl|
        CommentNews.find(sl).destroy
      end
      flash[:success] = t("comments_news.destroy")
    else
      params[:select].each do |sl|
        CommentNews.update(sl, status: 1)
      end
      flash[:success] = t("comments_news.update")
    end
    redirect_to "/admin/comments_news"
  end

end
