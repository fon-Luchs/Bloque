class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "Admin", password: "Admin", only: :destroy


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.commenter = current_user.user_name

    if @comment.save
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @article.comments.find(params[:id]).destroy

    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
