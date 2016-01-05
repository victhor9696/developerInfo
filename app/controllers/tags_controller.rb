class TagsController < ApplicationController
  def find_tags
    @tags = Tag.search_data params[:term]
    respond_to do |format|
      format.json { render json: @tags }
    end
  end
end
