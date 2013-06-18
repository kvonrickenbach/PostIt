class CommentsController < ApplicationController  

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = 1 #to be updated after authentication is built in

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added"
    else
      render 'posts/show'
    end

  end

end
