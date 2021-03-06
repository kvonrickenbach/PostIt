class CommentsController < ApplicationController  
  before_filter :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added"
    else
      render 'posts/show'
    end

  end

end
