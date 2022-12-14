class CommentsController < ApplicationController

  def index 
    if params[:user_id]
      comments = Comment.where("author_id = #{params[:user_id]}")
    elsif params[:artwork_id]
      comments = Comment.where("artwork_id = #{params[:artwork_id]}")
    else
      comments = Comment.all
    end
    render json: comments
  end

  def create  
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment_url
  end

  private
  def comment_params
    params.require(:comments).permit(:body, :author_id, :artwork_id)
  end
end