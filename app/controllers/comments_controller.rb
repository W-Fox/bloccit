class CommentsController < ApplicationController
  def create
     @topic = @post.topic
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(comment_params)
     @comment.post = @post
     authorize @comment 
      if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@topic, @post]
      else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
      end
  end
  
  def destroy
     @topic = @post.topic
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end