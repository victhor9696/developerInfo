class Admin::CommentsVideosController < ApplicationController
  layout "admin"
  before_filter :logged_or_redirect
  def index
     @comments_video = CommentVideo.list "0"
  end

  def valid
    if params[:flag] == "0"
      params[:select].each do |sl|
        CommentVideo.find(sl).destroy
      end
      flash[:success] = t("comments_video.destroy")
    else
      params[:select].each do |sl|
        CommentVideo.update(sl, status: 1)
      end
      flash[:success] = t("comments_video.update")
    end
    redirect_to "/admin/comments_videos"
  end

end
