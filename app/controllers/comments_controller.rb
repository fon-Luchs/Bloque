class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.create(comment_params)

    if @comment.save
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @article.comments.find(params[:id]).destroy

    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
