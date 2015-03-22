class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = current_user
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comments_params)
    @comment.user_id = @user.id
    @comment.article_id = @article.id

    if @comment.save
      redirect_to article_path(@article), notice: "Thank you for comment!"
    else
      redirect_to article_path(@article), notice: "You didn't write any comments!"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:body)
  end
end