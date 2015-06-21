class CommentsController < ApplicationController
  def new

  end

  def create
    # customer_id 取得
    # user_id 取得
    # body 取得

    @comment = Comment.new(user_id: current_user.id, customer_id: comment_params[:customer_id].to_i, body: comment_params[:body])
    # @comment = Comment.new(comment_params)
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
      :user_id,
    )
  end
end
