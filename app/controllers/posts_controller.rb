class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      tags = Vision.get_image_data(@post.image)
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @post = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    post.tags.destroy_all
    tags = Vision.get_image_data(post.image)
      tags.each do |tag|
        post.tags.create(name: tag)
      end
    redirect_to post_path(post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :explanation, :impressions, :rate, :created_at, :updated_at)
  end
end
