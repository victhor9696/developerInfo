class CommentsController < ApplicationController

  def news
    if params[:news_id] == "" || params[:news_id].nil?
      render :json => {status: false}
      return
    end
    @comments = CommentNews.create(news_id: params[:news_id],message: params[:message],status: 0,user_id: session[:id])
    if @comments
      render :json => {status: true}
      return
    end
  end

  def video
    if params[:video_id] == "" || params[:video_id].nil?
      render :json => {status: false}
      return
    end
    @comments = CommentVideo.create(video_id: params[:video_id],message: params[:message],status: 0,user_id: session[:id])
    if @comments
      render :json => {status: true}
      return
    end
  end
end
