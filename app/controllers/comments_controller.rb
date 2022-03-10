class CommentsController < ApplicationController
  before_action :is_author?, only: [:edit, :update, :destroy]

  # POST 'posts/2/comment'
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.new()
    @comment.body = params["comment"]
    @comment.post_id = params["id"]
    @comment.user_id = current_user.id
    @comment.save

    render json: @comment, status: :created
  end

  # PATCH 'posts/2/comment/3'
  def edit
    @comment = Comment.find(params["id"])
    @comment.body = params["comment"]
    @comment.save

    render json: @comment
  end

  # DELETE /posts/1/comment/3
  def destroy
    Comment.find(params["id"]).destroy
  end

  def is_author?
    @comment = Comment.find(params["id"])
    render json: { message: "forbidden" } unless @comment.user_id == current_user.id
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
