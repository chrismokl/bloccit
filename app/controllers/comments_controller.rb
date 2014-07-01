class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find( params[:post_id])
    @comments = @post.comments

    @comment = Comment.new( comment_params )
    @comment.user = current_user
    @comment.post = @post

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find( params[:post_id])
   
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again"
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post]}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body
    )
  end
end

# params = {:post_id: 1234, :topic_id: 234, comment: {body: 'whatever'}}


# Comment
#   body
#   post
#   user