class PostsController < ApplicationController
  before_action :find_post, only: [:show , :edit , :update ,:distroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end


  def new
    @post =Post.new
  end

  def create
    @post =Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post =Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redner 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
