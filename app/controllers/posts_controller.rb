class PostsController < ApplicationController
  before_action :set_post, only: %i[ update destroy]
  before_action :is_author?, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    @post = Post.find(params["id"])
    render json: @post
  end

  # POST /posts
  def create
    @post = current_user.posts.new()
    @post.title = params['title']
    @post.body = params['body']
    #@post.tags = Tag.create(tag:params['tags']).id
    @post.save
    HardJob.perform_in(24.hours.from_now,@post.id)
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def is_author?
    render json: { message: "forbidden" } unless @post.user == current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :comments,:tags)
  end
end
