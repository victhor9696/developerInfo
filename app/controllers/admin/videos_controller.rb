class Admin::VideosController < ApplicationController
  include ApplicationHelper
  layout "admin"
  before_action :set_videos, only: [:show, :edit, :update, :destroy]
  before_filter :logged_or_redirect

  def index
    @videos = Video.search_data params[:query], params[:page],session[:id],session[:role]
    @qtd_page = @videos.count / Video::Videos_per_page
    @query = params[:query]
  end

  def new
    @video = Video.new
    if session[:role]
      @video.status = 0
    end
  end

  def edit
    @video = Video.find(params[:id])
    if @video.nil?
      flash[:danger] = t("video.new_not_found")
    end
  end

  def create
    @videos = Video.new(videos_params)
    @videos.user_id = session[:id]
    if !session[:role]
      @videos.status = 0
    end
    respond_to do |format|
      if @videos.save
        Video.save_tags(params[:tag_names_br],@videos,Tag::Tag_names_br)
        Video.save_tags(params[:tag_names_es],@videos,Tag::Tag_names_es)
        flash[:success] = t("video.success")
        format.html { redirect_to "/admin/videos" }
      else
        format.html { render "/admin/videos/new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @videos.update(videos_params)
        Video.save_tags(params[:tag_names_br],@videos,Tag::Tag_names_br)
        Video.save_tags(params[:tag_names_es],@videos,Tag::Tag_names_es)
        flash[:success] = t("video.success")
        format.html { redirect_to '/admin/videos'}
      else
        flash[:danger] = t("video.error_save")
        format.html { render :edit }
      end
    end
  end

  def destroy
    @videos.destroy
    respond_to do |format|
      flash[:success] = t('video.success_destroy')
      format.html { redirect_to videoss_url}
    end
  end

  private
    def set_videos
      @videos = Video.find(params[:id])
    end

    def videos_params
      videos_params = params.require(:video).permit(:title_br,
      :description_br,:title_es, :description_es, :status,:iframe  )
      videos_params[:iframe] = protect videos_params[:iframe]
      return videos_params
    end
end
