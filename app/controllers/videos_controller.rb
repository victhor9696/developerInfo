class VideosController < ApplicationController
  def show
    @video = Video.friendly.find(params[:slug])
    @voted_count = VideoAvaliable.where(video_id: @video.id).count
    @avg = VideoAvaliable.where(video_id: @video.id).average(:score).to_i
    @already_voted = already_voted? @video.id
    @comments_videos = CommentVideo.fetch_all_comments @video.id
  end

  def avaliable
    return_state = false;
    if already_voted? params[:video_id]
      VideoAvaliable.create(user_id: session[:id],video_id: params[:video_id],score: params[:score])
      return_state = true
    end
    render :json => {:status => return_state}
  end

  def already_voted? video_id
    if logged?
      if VideoAvaliable.where(user_id: session[:id],video_id: video_id).first.nil?
        return true
      end
      return false
    end
    return false;
  end
end
