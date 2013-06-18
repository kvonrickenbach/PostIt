class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  	@comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
    
    @post.user_id = 1
    if @post.save
      redirect_to posts_path, notice: "Your post was created successfully!"
    else #validation failure
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: "Your post has been updated"
    else
      render :edit
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

#  def destroy    
#  end
end
