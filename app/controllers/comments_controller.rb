class CommentsController < ApplicationController
  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @comment.customer
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to @comment.customer
  end

  private
  def comment_params
    # customers.require(:key).permit(:filter)
    params.require(:comment).permit(
      :body,
      :customer_id,
    )
  end
end
