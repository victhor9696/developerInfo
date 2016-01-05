class Admin::NewsController < ApplicationController
  layout "admin"
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_filter :logged_or_redirect

  def index
    @news = News.search_data params[:query], params[:page], session[:id], session[:role]
    @qtd_page = @news.count / News::News_per_page
    @query = params[:query]
  end

  def new
    @news = News.new
    if session[:role]
      @news.status = 0
    end
  end

  def edit
    @news = News.find(params[:id])
    if @news.nil?
      flash[:danger] = t("news.new_not_found")
    end
  end

  def create
    @news = News.new(news_params)
    @news.user_id = session[:id]
    if !session[:role]
      @news.status = 0
    end
    respond_to do |format|
      if @news.save
        News.save_tags(params[:tag_names_br],@news,Tag::Tag_names_br)
        News.save_tags(params[:tag_names_es],@news,Tag::Tag_names_es)
        flash[:success] = t("news.success")
        format.html { redirect_to "/admin/news" }
      else
        format.html { render "/admin/news/new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @news.update(news_params)
        News.save_tags(params[:tag_names_br],@news,Tag::Tag_names_br)
        News.save_tags(params[:tag_names_es],@news,Tag::Tag_names_es)
        flash[:success] = t("news.success")
        format.html { redirect_to '/admin/news'}
      else
        flash[:danger] = t("news.error_save")
        format.html { render :edit }
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      flash[:success] = t('news.success_destroy')
      format.html { redirect_to newss_url}
    end
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      news_params = params.require(:news).permit(:title_br,
      :description_br,:title_es, :description_es, :status ,:tag_names )
    end
end
