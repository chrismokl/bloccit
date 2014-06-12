class CommentsController < ApplicationController
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