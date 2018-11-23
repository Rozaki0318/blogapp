class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], blog_id: params[:blog_id], user_id: current_user.id)
    redirect_to "/blogs/#{@comment.blog_id}"
  end
end
